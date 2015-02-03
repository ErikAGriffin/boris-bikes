require 'BikeContainer'

class DockingStation < BikeContainer

  def dock(bike)
    raise "Station is Full" if full?
    @bikes << bike
  end

end
