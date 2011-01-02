class Photo < ActiveRecord::Base
  belongs_to :webpage
  belongs_to :gallery

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
