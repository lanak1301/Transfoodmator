class UsersController < ApplicationController

  def show
    # @current_user = current_user
    @user = params[:id] ? User.find(params[:id]) : current_user
    @recipes = @user.recipes.all
  end

end
