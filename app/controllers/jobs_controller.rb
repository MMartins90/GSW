class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    if params[:search].present? && params[:search][:query].present?
      @jobs = Job.search_by_job_and_sector_and_salary,(params[:search][:query])
      # @jobs = Job.all
    elsif params[:category]
      @Jobs = Job.where(:category => params[:category])
    else
      @Jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: 'Job succsfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :location, :description, :salary, :sector)
  end
end
