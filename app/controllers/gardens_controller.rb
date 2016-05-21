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
    @walk = Gardens::Walk.new(@garden).walk
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])

    if @garden.update(garden_params)
      redirect_to @garden
    else
      render 'edit'
    end
  end

  def destroy
    @garden = Garden.find(params[:id])
  end

  private

    def garden_params
      params.require(:garden).permit(:name, author_ids: [])
    end

end
