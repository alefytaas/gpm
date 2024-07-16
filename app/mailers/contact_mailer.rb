class ContactMailer < ApplicationMailer
  default from: ENV['SMTP_USER_NAME'] # Altere para o endereço de email que você usará

  def send_contact_email(email, subject, message)
    @message = message
    mail(to: ENV['SMTP_USER_NAME'], subject: subject, from: email)
  end
end