class User < ActiveRecord::Base

  has_many :interest_points

  validates :email, presence: true
  # validate :email_is_valid

  def email!
    # send some fucking emails
  end

  private
  def email_is_valid
    #whatever
  end

end
