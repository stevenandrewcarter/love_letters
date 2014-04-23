class WorkshopsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @workshops = Workshop.all
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if @workshop.save
      redirect_to workshops_path
    else
      render :new
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(:name, :date)
  end
end
