class Crime < ActiveRecord::Base

  def self.in_rect p1, p2
    self
      .where("crimes.latitude BETWEEN ? AND ?", p1[:lat], p2[:lat])
      .where("crimes.longitude BETWEEN ? AND ?", p1[:lng], p2[:lng])
  end

  def as_json opts = {}
    {
      latitude: latitude,
      longitude: longitude
    }
  end

end
