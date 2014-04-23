class EventsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @events = Event.all
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
    @msg = @event.destroy ? {:status => 'ok', :message => 'Success!'} : {:status => 'failed', :message => 'Error!'}
    respond_to { |format| format.json { render :json => @msg } }
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_date)
  end
end
