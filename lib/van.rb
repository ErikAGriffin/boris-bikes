require 'BikeContainer'

class Van < BikeContainer



  def location
    @location
  end

  def travel_to(destination)
    @location = destination
  end

end
