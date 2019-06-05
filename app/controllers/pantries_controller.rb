class PantriesController < ApplicationController
  before_action :require_login
  def new
    @ingredients = Ingredient.all
    @pantry = Pantry.new
  end

  def create
    pantry = Pantry.create(pantry_params)
  end

  private

    def pantry_params
      params.require(:pantry).permit(:location)
    end
end
