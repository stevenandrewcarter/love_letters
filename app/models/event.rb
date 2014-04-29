class Event < ActiveRecord::Base
  has_attached_file :image, :styles => {:medium => '200x100>'}, :default_url => '/images/events/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true
  validates :date, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :country_code, presence: true
  validates :state_code, presence: true

  def self.featured_events(user_id)
    Event.all.limit(4)
  end

  def country
    Carmen::Country.coded(country_code).name
  end

  def province
    country = Carmen::Country.coded(country_code)
    country.subregions.coded(state_code).name
  end
end
