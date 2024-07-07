class JornadasController < ApplicationController
  before_action :set_jornada, only: %i[ show edit update destroy ]
  before_action :set_escala, only: [:new, :create]
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
    @escala = Escala.find_by(id: @jornada.escala_id)
    @user = User.find_by(id: @jornada.user_id)
  end

  # POST /jornadas or /jornadas.json


  def create
    @jornada = Jornada.new(jornada_params)
    @escala = Escala.find_by(id: @jornada.escala_id)
    
  

    Rails.logger.debug "Creating Jornada with params: #{jornada_params.inspect}"
    Rails.logger.debug "Escala: #{@escala.inspect}"

    respond_to do |format|
      if @jornada.save
        format.html { redirect_to "/escalas/#{@escala.id}", notice: "Jornada was successfully created." }
        format.json { render :show, status: :created, location: @jornada }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jornada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jornadas/1 or /jornadas/1.json
  def update
    respond_to do |format|
      if @jornada.update(jornada_params)
        format.html { redirect_to jornada_url(@jornada), notice: "Jornada was successfully updated." }
        format.json { render :show, status: :ok, location: @jornada }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jornada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jornadas/1 or /jornadas/1.json
  def destroy
    @jornada.destroy!

    respond_to do |format|
      format.html { redirect_to jornadas_url, notice: "Jornada was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jornada
      @jornada = Jornada.find(params[:id])
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
