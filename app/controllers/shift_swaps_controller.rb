# app/controllers/shift_swaps_controller.rb
class ShiftSwapsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_jornada, only: [:new, :create]
  before_action :set_shift_swap, only: [:approve, :reject, :show]

  def new
    @shift_swap = ShiftSwap.new
    @jornadas_troca = Jornada.where.not(id: params[:jornada_id]).where.not(user_id: current_user).group_by(&:data)
  end

  def create
    @shift_swap = @jornada.shift_swaps.build(shift_swap_params)
    @shift_swap.requesting_doctor = current_user
    @shift_swap.status = 'pending'
    
    if(ShiftSwap.where(shift_swap_params).any?)
      @shift_swap = ShiftSwap.where(shift_swap_params)
      redirect_to shift_swap_path(@shift_swap), notice: 'Solicitação já existente.'
      else
    if @shift_swap.save
      redirect_to shift_swap_path(@shift_swap), notice: 'Solicitação de troca de plantão criada com sucesso.'
    else
      render :new
    end
    end

  end

  def index
    @shift_swaps = ShiftSwap.where(receiving_doctor: current_user).where(status: 'pending')
  end

  def show
  end

  def approve
    if @shift_swap.update(status: 'approved')
      redirect_to shift_swaps_url, notice: 'Troca de turno aprovada com sucesso.'
    else
      redirect_to shift_swaps_url, alert: 'Erro ao aprovar a troca de turno.'
    end
  end

  # PATCH /shift_swaps/1/reject
  def reject
    if @shift_swap.update(status: 'rejected')
      redirect_to shift_swaps_url, notice: 'Troca de turno rejeitada com sucesso.'
    else
      redirect_to shift_swaps_url, alert: 'Erro ao rejeitar a troca de turno.'
    end
  end

  private

  def set_jornada
    @jornada = Jornada.find(params[:jornada_id])
  end

  def set_shift_swap
    @shift_swap = ShiftSwap.find(params[:id])
  end

  def shift_swap_params
    params.require(:shift_swap).permit(:receiving_doctor_id)
  end
end
