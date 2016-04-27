class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = params[:id] == 'random' ? Recipe.order('RAND()').first : Recipe.unscoped.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.ingredients_attributes = ingredients_params
    if @recipe.save
      redirect_to action: 'show', id: @recipe.id
    else
      render action: 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.attributes = recipe_params
    @recipe.ingredients_attributes = ingredients_params
    if @recipe.save
      redirect_to action: 'show', id: @recipe.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.active = false
    if @recipe.save
      redirect_to action: 'index'
    else
      redirect_to 'show'
    end
  end

  def bin
    @recipes = Recipe.unscoped.where(active: false).all
  end

  def restore
    @recipe = Recipe.unscoped.find(params[:id])
    @recipe.active = true
    if @recipe.save
      redirect_to action: 'bin'
    else
      redirect_to 'show'
    end
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :servings, :total_time, :category_id)
  end

  def ingredients_params
    (params[:ingredients] || [])
      .map {|ingredient| ingredient.permit(:name, :amount) }
      .select {|ingredient| ingredient[:name].present? || ingredient[:amount].present? }
  end

end