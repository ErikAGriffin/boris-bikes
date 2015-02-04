require 'bike_container'

class Van < BikeContainer




  def dock(bike)
    if full?
      raise 'Van is full'
    end
    @bikes << bike
  end

  def travel_to(destination)
    @location = destination
  end


  def location
    @location
  end





end