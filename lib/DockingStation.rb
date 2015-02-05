require 'BikeContainer'

class DockingStation < BikeContainer

  def dock(bike)
    raise "Station is Full" if full?
    @bikes.add_bike(bike)
  end

end
