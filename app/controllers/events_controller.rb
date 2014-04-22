class EventsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @events = Event.all
  end
end
