class Webpage < ActiveRecord::Base
  belongs_to :publisher
  has_many :photos
  
  def title_safe
    if title && title.length > 0
      title
    else
      url.split('/').last
    end
  end
end
