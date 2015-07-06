class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @jobs = policy_scope(Job).order("id DESC").all
  end

  def show
  end

  def new
    @job = current_user.jobs.new
    authorize @job
  end

  def edit
  end

  def create
    @job = current_user.jobs.new(job_params)
    authorize @job
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def update
    @job.update(job_params)
    if @job.save
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
    def set_job
      @job = Job.find(params[:id])
      authorize @job
    end

    def job_params
      params.require(:job).permit(:title, :description, :company, :url, :city, :category, :user_id)
    end
end