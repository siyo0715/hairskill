class ContactsController < ApplicationController
  def about
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact)
      redirect_to root_path
    else
      render 'about'
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render 'contact_about'
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end
end
