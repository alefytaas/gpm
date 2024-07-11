class UserMailer < Devise::Mailer
  default from: 'postmaster@sandbox67fbaddcaf8446798407d6edfef15325.mailgun.org'
  helper :application # Acesso a todos os helpers definidos em application_helper
  include Devise::Controllers::UrlHelpers # Inclusão opcional para acesso a helpers de URL do Devise
  default template_path: 'devise/mailer' # Garante que o mailer utilize as views do Devise

  def confirmation_instructions(record, token, opts = {})
    opts[:format] = :html
    super
  end

  def reset_password_instructions(record, token, opts = {})
    opts[:from] = 'postmaster@sandbox67fbaddcaf8446798407d6edfef15325.mailgun.org'
    super
  end

  def unlock_instructions(record, token, opts = {})
    opts[:from] = 'postmaster@sandbox67fbaddcaf8446798407d6edfef15325.mailgun.org'
    super
  end
end
