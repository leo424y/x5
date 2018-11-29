class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # @q = Task.ransack(content_cont_any: params[:q][:content], state_cont_any: params[:q][:content])
    # @tasks = @q.result.in_end_time_desc
    @tasks = Task.all
    if params[:task]
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
    @task = Task.new(task_params)
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
    params.require(:task).permit(:content, :end_time, :state, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
