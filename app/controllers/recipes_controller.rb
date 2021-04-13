class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only:[:edit, :update, :destroy]
  before_action :search_recipe, only: [:index, :search]

  def index
    @recipes = Recipe.includes(:user).order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @messages = Message.all
    @message = Message.new
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      reder :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :recipe_name, :cooking_method, :cooking_time_id, :ingredients, :nutrition).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    unless current_user == @recipe.user
     redirect_to root_path
    end
  end

  def search_recipe
    @p = Recipe.ransack(params[:q])
  end

end
