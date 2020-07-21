class ApplysController < ApplicationController
  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new(job_params)
    if job.save
      redirect_to jobs_path, notice: 'Job succsfully created'
    else
      render :new
    end
  end

  private

  def apply_params
    params.require(:job).permit(:full_name, :location, :cover_letter, :cv)
  end
end
