class HomeController < ApplicationController
  def index
    @infos = {email: current_user.email, first_name: current_user.first_name, last_name: current_user.last_name, user_type: current_user.user_type}
    @date = Date.today
    @adm_escala = adm_escala?
    @user = current_user
    @jornadas = Jornada.where(user_id: current_user)
    @escala = Escala.where(id: @jornadas.pluck(:escala_id))


  end

  def new_relatorio
  
  end

  def relatorio
    @data_inicial =  Date.parse(params[:start_date])
    @data_final =   Date.parse(params[:end_date])
    @escala_id = params[:escala_id]
    @type_relatorio = params[:type_relatorio]
    @medico_id = params[:medico_id]

    if(@type_relatorio == "" || @escala_id == "")
      redirect_to new_relatorio_path, alert: "Selecione uma escala e um tipo de relatório"
    else






    Rails.logger.info "Data de Início: #{@data_inicial}"
    Rails.logger.info "Data de Término: #{@data_final}"
    Rails.logger.info "Escala ID: #{@escala_id}"
    Rails.logger.info "Tipo de Relatório: #{@type_relatorio}"
    Rails.logger.info "Medico ID: #{@medico_id}"


    respond_to do |format|
      format.html { render plain: "Formato HTML não suportado" }
      format.pdf do
        @pdf = render_to_string :pdf => "Relatorioteste",
               template: "home/" + @type_relatorio,
               layout: "pdf",
               formats: [:html],
               locals: {data_inicial: @data_inicial, data_final: @data_final, escala_id: @escala_id, medico_id: @medico_id},
               footer: { 
               left: "Gerador por: #{current_user.email}  no Sistema GPM ",
               right: "Página [page] de [topage]"
             }

        send_data (@pdf ), filename: "Relatorio #{Time.now.strftime("%d/%m/%Y %H:%M:%S")}"+".pdf", type: "application/pdf"

      
        
      end
    end
    

    end
     
  end

  def medicos_por_escala
    escala = Escala.find(params[:escala_id])
    @medicos = escala.users
    render json: @medicos.map { |medico| { id: medico.id, nome: "#{medico.first_name} #{medico.last_name}" } }
  end

  def month
    @date = Date.parse(params.fetch(:date, Date.today.to_s))
    # @events = Event.where(start_date: @date.all_month)
  end

  def about
  end

  def atendimento
  end

  

  # def week
  # end

  # def day
  # end
end
