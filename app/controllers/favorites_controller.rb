class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    if @post.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end

  private
  def set_post
    @recipe = Recipe.find(params[:recipe_id])
  end
end
