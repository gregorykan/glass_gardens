class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save!
      redirect_to @work
    else
      render 'new'
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    if @work.update(work_params)
      redirect_to @work
    else
      render 'edit'
    end
  end

  def destroy
    @work = Work.find(params[:id])
  end

  private

    def work_params
      params.require(:work).permit(:name, :text)
    end

end