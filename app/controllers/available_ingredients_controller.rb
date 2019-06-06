class AvailableIngredientsController < ApplicationController

  def create
    AvailableIngredient.create(available_params)
    redirect_to pantry_path(params[:available_ingredient][:pantry_id])
  end

  private
    def available_params
      params.require(:available_ingredient).permit(:ingredient_id, :pantry_id, :quantity, :unit)
    end
end
