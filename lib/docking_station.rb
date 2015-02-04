require 'bike_container'

class DockingStation < BikeContainer


def dock(bike)
	raise "Station is full" if full?
	@bikes << bike
end

end