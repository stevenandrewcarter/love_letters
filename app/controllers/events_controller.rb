# Events Controller
class EventsController < ApplicationController
  skip_before_filter :authenticate_user!

  def subregion_options
    render partial: 'shared/country_select', locals: {owner: params[:owner].to_sym, country_code: params[:country_code]}
  end

  def index
    @events = Event.all
    @suggested_events = Event.featured_events(current_user.id) if user_signed_in?
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @msg = {status: @event.destroy, message: @event.errors.full_messages}
    respond_to { |format| format.json { render json: @msg } }
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :image, :country_code, :state_code)
  end
end
