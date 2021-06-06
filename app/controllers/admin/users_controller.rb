class Admin::UsersController < ApplicationController


  def index
    @users = User.all.includes(:tasks)
  end

  def show
    @user = User.find(params[:id])
  end

end
