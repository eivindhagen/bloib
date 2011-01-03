class Photo < ActiveRecord::Base
  belongs_to :webpage
  belongs_to :gallery
  
  validates_uniqueness_of :photo_url

  def title_safe
    if title && title.length > 0
      title
    elsif webpage.title && webpage.title.length > 0
      webpage.title
    else
      '<i>Unknown</i>'.html_safe
    end
  end
end
