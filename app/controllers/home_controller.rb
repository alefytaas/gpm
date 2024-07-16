class HomeController < ApplicationController
  def index
    @infos = {email: current_user.email, first_name: current_user.first_name, last_name: current_user.last_name, user_type: current_user.user_type}
    @date = Date.today
    @adm_escala = adm_escala?
    @user = current_user
    @jornadas = Jornada.where(user_id: current_user)
    @escala = Escala.where(id: @jornadas.pluck(:escala_id))


  end
  def month
    @date = Date.parse(params.fetch(:date, Date.today.to_s))
    # @events = Event.where(start_date: @date.all_month)
  end

  def about
  end

  

  # def week
  # end

  # def day
  # end
end
