class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :check_login

  def deadline_mailer
    tasks = Task.includes(:user).where.not(state: 'done').where("end_time > ? AND end_time < ?", Time.now+3600*24, Time.now+3600*24*5)

    tasks.each do |task|
      to = task.user.email
      subject = "Hi, #{task.user.name}. Your task's [#{task.content}] deadline is #{task.end_time}!" 
      UserNotifierMailer.send_mail(to, subject).deliver_later!
    end 
  end

  def index
    @tasks = current_user.tasks.includes(:tags)

    if params[:tag]
      @tasks = @tasks.tagged_with(params[:tag])
    elsif params[:task]
      @tasks = @tasks.where(state: params[:task][:state]) if params[:task][:state].present?
      @tasks = @tasks.where("content LIKE ?", "%#{params[:task][:content]}%") if params[:task][:content].present?
      if params[:task][:priority].present?
        @tasks = case params[:task][:priority] 
        when 'asc'
          @tasks.in_priority_desc
        when 'desc'
          @tasks.in_priority_asc
        else
          @tasks
        end
      else
        @tasks = @tasks.in_end_time_desc
      end
    else
      @tasks = @tasks.in_end_time_desc
    end
    @tasks = @tasks.page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: I18n.t('Task was successfully created')
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: I18n.t('Task was successfully updated')
    else
      render :edit
    end
  end 

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: I18n.t('Task was successfully destroyed')
  end

  private

  def task_params
    params.require(:task).permit(:content, :end_time, :state, :priority, :all_tags)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
