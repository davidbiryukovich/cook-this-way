class ClucksController < ApplicationController

  def index
    @clucks = Cluck.all
    @cluck = Cluck.new
  end

  def show
    @cluck = Cluck.find(params[:id])
  end

  def new
    @cluck = Cluck.new
  end

  def create
    @cluck = Cluck.new(cluck_params)
    if @cluck.save
      redirect_to action: 'index', id: @cluck.id
    else
      @clucks = Cluck.all
      render action: 'index'
    end
  end

  def edit
    @cluck = Cluck.find(params[:id])
  end

  def update
    @cluck = Cluck.find(params[:id])
    @cluck.attributes = cluck_params
    if @cluck.save
      redirect_to action: 'show', id: @cluck.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @cluck = Cluck.destroy(params[:id])
    redirect_to action: 'index'
  end

  private

  def cluck_params
    params.require(:cluck).permit(:title, :cluck)
  end

end
