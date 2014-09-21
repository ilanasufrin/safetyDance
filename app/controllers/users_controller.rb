class UsersController < ApplicationController

  post "/users" do
    user = User.find_or_create_by(email: params["email"])
    if user.persisted?
      p1 = InterestPoint.find_or_create_by(point_params("p1", user))
      p2 = InterestPoint.find_or_create_by(point_params("p2", user))
      if p1.persisted? && p2.persisted?
        201
      else
        422
      end
    else
      status 422
      json user.errors
    end
  end

  def point_params ident, user
    {
      "user_id" => user.id,
      "latitude" => params[ident]["latitude"],
      "longitude" => params[ident]["longitude"]
    }
  end

end
