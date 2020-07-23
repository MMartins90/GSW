class ContactsController < ApplicationController
  
  require 'mail_form'
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:full_name, :company_name, :email, :contact_number, :message)
  end

end
