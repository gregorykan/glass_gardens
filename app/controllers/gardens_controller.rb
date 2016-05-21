class GardensController < ApplicationController

  def index
    @gardens = Garden.all
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)

    if @garden.save!
      redirect_to @garden
    else
      render 'new'
    end
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])
  end

  def destroy
    @garden = Garden.find(params[:id])
  end

  private

    def garden_params
      params.require(:garden).permit(:name, authors: [])
    end

end
