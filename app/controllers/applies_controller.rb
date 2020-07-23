class AppliesController < ApplicationController

  require 'mail_form'

  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new(job_params)
    @apply.request = request
    if @apply.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Application Sent Successfully'
    else
      flash.now[:error] = 'Cannot send application.'
      render :new
    end
  end

  private

  def apply_params
    params.require(:apply).permit(:full_name, :location, :cover_letter, :cv, :email)
  end
end
