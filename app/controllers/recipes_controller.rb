class RecipesController < ApplicationController
  before_action :require_login
  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = Ingredient.all.order(:name)
    @available = @recipe.required_ingredients.build
  end

  def create
    recipe = Recipe.create(recipe)
    recipe.user_id = current_user.id
    recipe.save
    redirect_to recipe_path(recipe)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  private

    def recipe_params
      params.require(:recipe).permit(:location)
    end
end
