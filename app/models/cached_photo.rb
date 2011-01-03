class CachedPhoto < ActiveRecord::Base

  def pathname
    "#{Rails.root}/public/images/cached_photos/#{filename}"
  end

  def href
    "/images/cached_photos/#{filename}"
  end

end
