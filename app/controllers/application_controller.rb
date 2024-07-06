class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dt_nasc, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :dt_nasc, :user_type])
  end

  private

  def adm_escala?
    if current_user.user_type == "Medico_adm"
      return true
    else
      return false
    end
  end
end
