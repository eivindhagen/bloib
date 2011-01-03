require 'nokogiri'
require 'open-uri'

class Webpage < ActiveRecord::Base
  belongs_to :publisher
  has_many :photos
  
  validates_uniqueness_of :url

  before_save :title_check
    
  def title_check
    return unless title.blank?
    doc = Nokogiri::HTML(open(url))
    title_tag = doc.at_css('title')
    if title_tag
      if title_tag.text.length > 0
        self.title = title_tag.text
      else
        self.title = url.split('/').last
      end
      save!
    end
  end
  
  def title_check_and_save
    return unless title.blank?
    title_check
    save!
  end
  
  def title_safe
    if title && title.length > 0
      title
    else
      url.split('/').last
    end
  end
end
