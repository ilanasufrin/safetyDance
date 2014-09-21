class Crime < ActiveRecord::Base

  scope :srs, -> {
    where(crimeType: ['MURDER', 'RAPE', 'ROBBERY', 'FELONY ASSAULT'])
  }

  def self.in_rect p1, p2
    north, south = [p1[:lat], p2[:lat]].min, [p1[:lat], p2[:lat]].max
    east, west = [p1[:lng], p2[:lng]].min, [p1[:lng], p2[:lng]].max
    self
      .where("crimes.latitude BETWEEN ? AND ?", north, south)
      .where("crimes.longitude BETWEEN ? AND ?", east, west)
  end

  def as_json opts = {}
    {
      latitude: latitude,
      longitude: longitude,
      type: crimeType
    }
  end

end
