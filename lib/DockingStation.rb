class DockingStation

  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def bikeCount
    @bikes.count
  end



end
