# Dashboard Controller
class DashboardController < ApplicationController
  def index
    @matches = User.matches(current_user.id).limit(4)
    @suggested_events = Event.featured_events(current_user.id)
  end
end
