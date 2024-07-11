class EscalasController < ApplicationController
  before_action :set_escala, only: %i[ show edit update destroy ]

  # GET /escalas or /escalas.json
  def index
    @escalas = Escala.where(id_medico_adm: current_user.id)
    
  end

  # GET /escalas/1 or /escalas/1.json
  def show
    @users = User.all
    @jornadas = Jornada.where(escala_id: @escala.id)
    
  end

  # GET /escalas/new
  def new
    @escala = Escala.new
    @Medicos = User.where(user_type: ['Medico', 'Medico_adm'])
  end

  # GET /escalas/1/edit
  def edit
    @Medicos = User.where(user_type: ['Medico', 'Medico_adm'])
  end

  # POST /escalas or /escalas.json
  def add_user
    @escala = Escala.find_by(params[:escala_id])
    @user = User.find_by(params[:user_id])
    
    if @escala.users.include?(@user)
      flash[:notice] = "Usuário já está associado a esta escala."
    else
      @escala.users << @user
      flash[:notice] = "Usuário adicionado à escala com sucesso."
    end
    
    redirect_to @escala
  end
  def create
    @escala = Escala.new(escala_params)
    #@jornada.escala_id = params[:escala_id] # Certifique-se de configurar o id da escala corretamente

    respond_to do |format|
      if @escala.save
        format.html { redirect_to escala_path(@escala), notice: "Escala was successfully created." }
        format.json { render :show, status: :created, location: @escala }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escalas/1 or /escalas/1.json
  def update
    respond_to do |format|
      if @escala.update(escala_params)
        format.html { redirect_to escala_url(@escala), notice: "Escala was successfully updated." }
        format.json { render :show, status: :ok, location: @escala }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escalas/1 or /escalas/1.json
  def destroy
    @escala.users.clear
    @escala.destroy!

    respond_to do |format|
      format.html { redirect_to escalas_url, notice: "Escala was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def convert_ids_to_hash(medico_ids)
    return {} if medico_ids.blank?
    medico_ids.each_with_object({}) { |id, hash| hash[id] = true }
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_escala
      @escala = Escala.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escala_params
      params.require(:escala).permit(:id_medico_adm, :setor, :mes_ref, user_ids: [])
    end
end
