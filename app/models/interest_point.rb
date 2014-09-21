class InterestPoint < ActiveRecord::Base

  belongs_to :user

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :user_id, presence: true

  def self.around point, delta = 0.004
    # 0.0025

    north = point.latitude + delta
    south = point.latitude - delta
    east = point.longitude - delta
    west = point.longitude + delta

    self.includes(:user)
      .where(latitude: south..north)
      .where(longitude: east..west)
      .distinct
  end

end
