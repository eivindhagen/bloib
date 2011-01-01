class Webpage < ActiveRecord::Base
  belongs_to :publisher
  has_many :photos
end
