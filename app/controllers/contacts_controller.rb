class ContactsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    subject = params[:subject]
    message = params[:message]

    ContactMailer.send_contact_email(email, subject, message).deliver_now
    redirect_to new_contact_path, notice: 'Sua mensagem foi enviada com sucesso.'
  end
end
