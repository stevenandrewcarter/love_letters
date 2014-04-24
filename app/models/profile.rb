class Profile < ActiveRecord::Base
  belongs_to :user

  before_save do
    self.complete = 0
    self.attributes.each do |k, v|
      self.complete += 1 unless k.eql?('id') || k.eql?('complete') || (v.kind_of?(String) && v.empty?)
    end
    self.complete = ((complete / (attributes.count - 2)) * 100).round(2)
  end

  has_attached_file :photo, :styles => { :medium => '300x300>', :thumb => '100x100>'}, :default_url => '/images/profiles/:style/missing.png'
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
