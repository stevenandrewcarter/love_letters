class Event < ActiveRecord::Base
  def self.featured_events(user_id)
    Event.all.limit(4)
  end
end
