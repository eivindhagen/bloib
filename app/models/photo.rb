class Photo < ActiveRecord::Base
  belongs_to :webpage
  belongs_to :gallery
end
