class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
  end
end
