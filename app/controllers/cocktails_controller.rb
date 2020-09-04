class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktails = Cocktail.all
    @cocktail = Cocktail.find(params[:id])
  end


end



