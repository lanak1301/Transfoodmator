class RecipesController < ApplicationController
  # protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @recipes = @user.recipes
  end

  def new
    @user = current_user
    @recipe = Recipe.new(creator: current_user)

    @recipe.ingredients.build
    @recipe.cooking_steps.build
    @recipes = Recipe.all
  end

  def create
    @user = current_user
    @recipe = Recipe.new(recipe_params)
    @recipe.creator_id = current_user.id
    if !@recipe.avatar? && @recipe.original_recipe
      @recipe.avatar = @recipe.original_recipe.avatar
    end

    if @recipe.save!
      redirect_to user_recipe_path(@user, @recipe) and return
    end
    redirect_to new_user_recipe_path(@user) and return
  end

  def show
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @recipe = Recipe.find(params[:id])
    @users = User.all
  end

  def copy
    @user = current_user

    original_recipe = Recipe.find(params[:recipe_id])
    @recipe = Recipe.new(name: original_recipe.name,
                     servings: original_recipe.servings,
                       avatar: original_recipe.avatar,
                      creator: original_recipe.creator,
           original_recipe_id: original_recipe.id )

    original_recipe.ingredients.each do |ingredient|
      @recipe.ingredients.build(name: ingredient.name, quantity: ingredient.quantity, unit_of_measurement: ingredient.unit_of_measurement)
    end

    # @recipe.ingredients.build(name: original_recipe.ingredients.first.name, quantity: original_recipe.ingredients.first.quantity, unit_of_measurement: original_recipe.ingredients.first.unit_of_measurement)
    # @recipe.ingredients.build(name: original_recipe.ingredients.last.name, quantity: original_recipe.ingredients.last.quantity, unit_of_measurement: original_recipe.ingredients.last.unit_of_measurement)

    @recipe.cooking_steps.build(name: original_recipe.cooking_steps.first.name, time: original_recipe.cooking_steps.first.time)
    @recipe.cooking_steps.build(name: original_recipe.cooking_steps.last.name, time: original_recipe.cooking_steps.last.time)

    render :new
  end

  def edit
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to user_recipe_path(current_user, @recipe)
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy

    redirect_to user_path(@user)
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name, :servings, :avatar, :original_recipe_id ,ingredients_attributes: [:id, :name, :quantity, :unit_of_measurement_id, :_destroy], cooking_steps_attributes: [:id, :name, :time, :_destroy])
  end

end
