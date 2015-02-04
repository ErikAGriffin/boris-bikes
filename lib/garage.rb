require 'BikeContainer'

class Garage < BikeContainer

  def dock(bike)
    if full?
      raise 'Garage is Full'
    end
    @bikes << bike
  end

end
