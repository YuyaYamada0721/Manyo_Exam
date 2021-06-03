class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
      if params[:task].present?
        if params[:task][:task_name].present? && params[:task][:status].present?
          @tasks = Task.task_name_fuzzy_search(params[:task][:task_name]).status_search(params[:task][:status])
        elsif params[:task][:task_name].present?
          @tasks = Task.task_name_fuzzy_search(params[:task][:task_name])
        elsif params[:task][:status].present?
          @tasks = Task.status_search(params[:task][:status])
        else
          @tasks = Task.all
        end
      elsif params[:sort_expired]
          @tasks = Task.order(expiration_deadline: :desc)
      elsif params[:sort_priority]
          @tasks = Task.order(priority: :desc)
      else
          @tasks = Task.all.order(created_at: :desc)
      end
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
    params.require(:task).permit(:task_name, :task_content, :expiration_deadline, :status, :task, :priority).merge(status: params[:task][:status].to_i, priority: params[:task][:priority].to_i)
  end
end
