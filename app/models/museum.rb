class Museum < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_latitude_and_longitude,
    against: [ :latitude, :longitude ],
    using: {
    tsearch: { prefix: true }
    }

  def get_museums(latitude, longitude)
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{latitude},#{longitude}&limit=10&access_token=MAPBOX_API_KEY"
    museums = URI.open(url).read
    museum = JSON.parse(museums)
    return "#{museum.name}, #{museum.postcode}"
  end
end
