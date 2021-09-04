class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_user, only: %i[edit update destroy]

  def index
    if params[:task].present?
      if params[:task][:name].present? && params[:task][:status].present?
        @tasks = current_user.tasks.name_fuzzy_search(params[:task][:name]).status_search(params[:task][:status]).page(params[:page]).per(10)
      elsif params[:task][:name].present?
        @tasks = current_user.tasks.name_fuzzy_search(params[:task][:name]).page(params[:page]).per(10)
      elsif params[:task][:status].present?
        @tasks = current_user.tasks.status_search(params[:task][:status]).page(params[:page]).per(10)
      elsif params[:task][:label_id].present?
        @tasks = current_user.tasks.joins(:labels).where(labels: { id: params[:task][:label_id] }).page(params[:page]).per(10)
      else
        @tasks = current_user.tasks.page(params[:page]).per(10)
      end
    elsif params[:sort_expired]
      @tasks = current_user.tasks.order(expiration_deadline: :desc).page(params[:page]).per(10)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order(priority: :desc).page(params[:page]).per(10)
    else
      @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to @task, notice: 'タスクを登録しました。'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました。'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :task_content, :expiration_deadline, :status, :task, :priority, { label_ids: [] }).merge(
      status: params[:task][:status].to_i, priority: params[:task][:priority].to_i
    )
  end
end
