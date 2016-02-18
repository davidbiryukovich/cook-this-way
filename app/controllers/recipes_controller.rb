class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to action: 'show', id: @recipe.id
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.attributes = recipe_params
    if @recipe.save
      redirect_to action: 'show', id: @recipe.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    redirect_to action: 'index'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :servings, :total_time)
  end

end