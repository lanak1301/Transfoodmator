class UsersController < ApplicationController

  def show
    # @current_user = current_user
    @user = params[:id] ? User.find(params[:id]) : current_user
    @users = User.all
  end

  def edit

  end

end
