class PantriesController < ApplicationController
  before_action :require_login
  def new
    @pantry = Pantry.new
  end

  def edit
    @pantry = Pantry.find_by(id: params[:id])
    @ingredients = Ingredient.all
  end

  def create
    pantry = Pantry.create(pantry_params)
    pantry.user_id = current_user.id
    pantry.save
    redirect_to pantry_path(pantry)
  end

  def show
    @pantry = Pantry.find_by(id: params[:id])
  end

  def quantify
    avail = AvailableIngredient.create(available_params)
    redirect_to edit_pantry_path(params[:ingredient][:pantry_id])
  end

  private

    def pantry_params
      params.require(:pantry).permit(:location)
    end

    def available_params
      params.require(:ingredient).permit(:ingredient_id, :quantity, :pantry_id, :unit)
    end
end
