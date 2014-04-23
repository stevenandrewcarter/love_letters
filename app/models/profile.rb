class Profile < ActiveRecord::Base
  belongs_to :user

  before_save do
    self.complete = 0
    self.attributes.each do |k, v|
      self.complete += 1 unless k.eql?('id') || k.eql?('complete') || (v.kind_of?(String) && v.empty?)
    end
    self.complete = ((complete / (attributes.count - 2)) * 100).round(2)
  end
end
