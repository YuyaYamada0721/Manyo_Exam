class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create show]
  before_action :ensure_current_user, only: %i[edit update show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @near_the_end_task = @user.tasks.where(expiration_deadline: Time.zone.today..Time.zone.today + 3).where.not(status: '完了')
    @expired_task = @user.tasks.where('expiration_deadline < ?', Time.zone.today).where.not(status: '完了')

    if @near_the_end_task.present? && @expired_task.present?
      flash[:alert] = '終了間近のタスクと期限切れのタスクがあります！'
    elsif @near_the_end_task.present?
      flash[:alert] = '終了間近のタスクがあります！'
    elsif @expired_task.present?
       flash[:alert] = '期限切れのタスクがあります！'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :user_email, :password, :password_confirmation, :admin)
  end
end
