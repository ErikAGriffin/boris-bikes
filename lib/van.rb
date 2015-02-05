require 'BikeContainer'

class Van < BikeContainer



  def location
    @location
  end

  def travel_to(destination)
    @location = destination
  end

  def collect_broken_bikes_from(station)
    station.broken_bikes.each do |bike|
      dock(station.release(bike))


    end
  end

  def unload_broken_bikes_to(destination)

    broken_bikes.each do |bike|

      release(destination.dock(bike))

    end



  end


end
