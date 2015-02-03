class DockingStation

	DEFAULT_CAPACITY = 10

  def initialize(options = {})
  	@capacity = options.fetch(capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def dock(bike)
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

end
