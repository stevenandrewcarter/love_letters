class Event < ActiveRecord::Base
  has_attached_file :image, :styles => {:medium => '200x100>'}, :default_url => '/images/events/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true
  validates :date, presence: true
  validates :name, presence: true
  validates :description, presence: true

  def self.featured_events(user_id)
    Event.all.limit(4)
  end
end
