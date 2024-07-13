class JornadasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_jornada, only: %i[ show edit update destroy ]
  before_action :set_escala, only: [:new, :create]
  #before_action :horario_livre, only: [:create, :update]
  # GET /jornadas or /jornadas.json
  def index
    @jornadas = Jornada.all
  end

  # GET /jornadas/1 or /jornadas/1.json
  def show
    @escala = Escala.find_by(id: @jornada.escala_id)
  end

  # GET /jornadas/new
  def new
    @jornada = Jornada.new(escala: @escala, data: params[:data])

  end

  # GET /jornadas/1/edit
  def edit
    @escala = Escala.find(@jornada.escala_id)
    @user = User.find(@jornada.user_id)
    if !data_escala
      render :edit, status: :unprocessable_entity
    end
  end

  # POST /jornadas or /jornadas.json


  def create
    @jornada = Jornada.new(jornada_params)
    if(Escala.find_by(id: @jornada.escala_id).id_medico_adm == current_user.id)
    if horario_livre && data_escala
      if @jornada.save
        redirect_to escala_path(@jornada.escala_id), notice: 'Jornada criada com sucesso.'
      else
        render :new
      end
    else
      render :new, status: :unprocessable_entity
    end
    else
       redirect_to escala_path(@jornada.escala_id) , alert: "Você não é administrador da escala"
    end
  end

  # PATCH/PUT /jornadas/1 or /jornadas/1.json
  def update
    @jornada = Jornada.find(params[:id])
    @escala = Escala.find_by(id: @jornada.escala_id)
  
    # Verifique se a escala está definida antes de prosseguir
    if @escala.nil?
      @jornada.errors.add(:base, "Escala não encontrada")
      render :edit, status: :unprocessable_entity
      return
    end
  
    # Atualize os atributos da jornada com os parâmetros recebidos
    @jornada.assign_attributes(jornada_params)
  
    # Verifique se o horário está livre e a data é válida para a escala
    if horario_livre_update && data_escala
      if @jornada.save
        redirect_to escala_path(@jornada.escala_id), notice: 'Jornada atualizada com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /jornadas/1 or /jornadas/1.json
  def destroy
    if(Escala.find_by(id: @jornada.escala_id).id_medico_adm != current_user.id)
      redirect_to escala_path(@jornada.escala_id) , alert: "Você não é administrador da escala"
    else
    @jornada.destroy!


    respond_to do |format|
      format.html { redirect_to escala_path(@jornada.escala_id) , notice: "Jornada was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jornada
      @jornada = Jornada.find(params[:id])
    end

    def horario_livre
      @escala = Escala.find_by(id: @jornada.escala_id)
      if(@escala.jornadas.where(data: @jornada.data, turno: @jornada.turno).exists?)
        @jornada.errors.add(:base, "Ja existe uma jornada nesta data e turno")
        return false
      end
      
      if User.find(@jornada.user_id).jornadas.where(data: @jornada.data, turno: @jornada.turno).exists?
        @jornada.errors.add(:base, "O usuário #{User.find(@jornada.user_id).first_name} já está de plantão nesta data e turno")
        return false
      end
      true
    end

    def horario_livre_update
      # Verificar se há outra jornada para o mesmo usuário na mesma data e turno
      if User.find(@jornada.user_id).jornadas.where.not(id: @jornada.id).where(data: @jornada.data, turno: @jornada.turno).exists?
        @jornada.errors.add(:base, "O usuário #{User.find(@jornada.user_id).first_name} já está de plantão nesta data e turno")
        return false
      end
    
      # Verificar se há outra jornada na escala na mesma data e turno
      if @escala.jornadas.where.not(id: @jornada.id).where(data: @jornada.data, turno: @jornada.turno).exists?
        @jornada.errors.add(:base, "Já existe uma jornada nesta data e turno")
        return false
      end
    
      true
    end

    def data_escala
      if @jornada.data.month == @escala.mes_ref.month && @jornada.data.year == @escala.mes_ref.year
        true
      else
        @jornada.errors.add(:base, "Essa data não faz parte dessa escala")
        false
      end
    end
    def set_escala
      id = params[:escala_id]
      @escala = Escala.find_by(id: id)
    end

    # Only allow a list of trusted parameters through.
    def jornada_params
      params.require(:jornada).permit(:data, :turno, :user_id, :escala_id)
    end
end
