class CrimesController < ApplicationController

  namespace "/crimes" do
    get "/:x1/:y1/:x2/:y2/?" do
      x1, y1, x2, y2 = params.slice("x1", "y1", "x2", "y2").values

      halt 422 unless [x1, y1, x2, y2].all? do |num|
        num =~ /^[-+]?[\d\.]+$/ && num.count(".") < 2
      end

      p1 = {lat: x1.to_f, lng: y1.to_f}
      p2 = {lat: x2.to_f, lng: y2.to_f}

      crimes = params["all"] ? Crime.all : Crime.srs
      json crimes.in_rect(p1, p2).sample(250) # Ensparsen the dataset
    end
  end

end
