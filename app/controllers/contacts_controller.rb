class ContactsController < ApplicationController
  
  require 'mail_form'
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if job.deliver
      redirect_to contact_path, notice: 'Message Sent!'
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:full_name, :company_name, :email, :contact_number, :message)
  end

end
