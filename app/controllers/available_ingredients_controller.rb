class AvailableIngredientsController < ApplicationController
  before_action :require_login

  def create
    AvailableIngredient.create(available_params)
    redirect_to user_pantry_path(current_user, params[:available_ingredient][:pantry_id])
  end

  private
    def available_params
      params.require(:available_ingredient).permit(:ingredient_id, :pantry_id, :quantity, :unit)
    end
end
