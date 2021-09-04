class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :admin_user

  def index
    @users = User.all.includes(:tasks).page(params[:page]).per(5)
  end

  def show
    @near_the_end_task = @user.tasks.near_the_end.completion_excepting
    @expired_task = @user.tasks.expired.completion_excepting
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
  end

  def admin_user
    return if current_user.admin?

    redirect_to tasks_path
    flash[:notice] = '管理者以外はアクセスできません。'
  end
end
