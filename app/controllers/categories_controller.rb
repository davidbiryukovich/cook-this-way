class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to action: 'show', id: @category.id
    else
      render action: 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.attributes = category_params
    if @category.save
      redirect_to action: 'show', id: @category.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @category = Category.destroy(params[:id])
    redirect_to action: 'index'
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end