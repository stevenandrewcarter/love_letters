# Services Controller
class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description)
  end
end
