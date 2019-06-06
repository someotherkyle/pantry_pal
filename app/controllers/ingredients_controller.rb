class IngredientsController < ApplicationController
  before_action :require_login
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to user_path(current_user)
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :wet)
    end
end
