class CrimesController < ApplicationController

  namespace "/crimes" do
    get "/:x1/:y1/:x2/:y2" do
      x1, y1, x2, y2 = params.slice("x1", "y1", "x2", "y2")
      halt 422 unless [x1, y1, x2, y2].all? do |num|
        num =~ /^[-+]?[\d\.]+$/ && num.count(".") < 2
      end

      p1 = {lat: x1, lng: y1}
      p2 = {lat: x2, lng: y2}

      json Crime.in_rect(p1, p2).sample(5) # Ensparsen the dataset
    end
  end

end
