class ResendMailer < ApplicationMailer
  def reset_password_instructions(record, token, opts={})
    @token = token
    mail(
      to: record.email,
      subject: "Reset password instructions"
    ) do |format|
      format.html { render 'devise/mailer/reset_password_instructions' }
    end
  end

  def deliver_resend_email(to, subject, body)
    Resend::Mail.send(
      from: 'your-email@your-domain.com',
      to: to,
      subject: subject,
      html: body
    )
  end

  private

  def mail(headers = {}, &block)
    if block_given?
      body = block.call(:resend)
      deliver_resend_email(headers[:to], headers[:subject], body)
    else
      deliver_resend_email(headers[:to], headers[:subject], headers[:body])
    end
  end
end
