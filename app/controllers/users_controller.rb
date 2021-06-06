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
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :user_email, :password, :password_confirmation)
  end
end
