class BikeContainer

  def initialize(capacity: 10)
    @capacity = capacity
    @bikes = []
  end

  def dock (bike)
    raise "Container is Full" if full?


    @bikes << bike
  end

  def bikeCount
    @bikes.count
  end

  def release(bike)
    @bikes.delete(bike)
  end

  def full?
    bikeCount == @capacity
  end

  def availableBikes
    @bikes.select { |bike| !bike.broken? }
  end


end


