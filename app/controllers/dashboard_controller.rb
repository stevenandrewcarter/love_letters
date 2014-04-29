# Dashboard Controller
class DashboardController < ApplicationController
  def index
    user_id = current_user.id
    @matches = User.matches(user_id).limit(4)
    @suggested_events = Event.featured_events(user_id)
  end
end
