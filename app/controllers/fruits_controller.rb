class FruitsController < ApplicationController

  def index
    @fruits = Fruit.all
    render 'index'
  end

  def show
    @fruit = Fruit.find(params[:id])
    render 'show'
  end

  def new
    @fruit = Fruit.new
    render 'new'
  end

  def edit
    @fruit = Fruit.find(params[:id])
    render 'edit'
  end

  def create
    @fruit = Fruit.new(fruit_params)

    if @fruit.save
      redirect_to @fruit, notice: 'Fruit was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @fruit = Fruit.find(params[:id])
    if @fruit.update(fruit_params)
      redirect_to @fruit, notice: 'Fruit was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @fruit = Fruit.find(params[:id])
    @fruit.destroy
    redirect_to fruits_url, notice: 'Fruit was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def fruit_params
    params.require(:fruit).permit(:shape, :description, :season, :rank)
  end

end
