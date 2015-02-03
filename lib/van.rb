require 'BikeContainer'

class Van < BikeContainer

  def initialize
    super

    @location = 'garage';

  end


  def location
    @location
  end

  def travel_to(destination)
    @location = destination
  end

end
