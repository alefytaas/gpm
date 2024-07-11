class InfosController < ApplicationController
  def admins
    @users = User.where(user_type: 'Medico_adm')
    @escalas = Escala.all

  end
end
