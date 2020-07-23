class AppliesController < ApplicationController
  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new(job_params)
    @apply.request = request
    if @apply.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

  private

  def apply_params
    params.require(:job).permit(:full_name, :location, :cover_letter, :cv)
  end
end
