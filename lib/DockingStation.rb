class DockingStation

  # Unneccessary old method of code.
  #
	# DEFAULT_CAPACITY = 10
  #
  # def initialize(options = {})
  #	 @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  #  @bikes = []
  # end

  def initialize(capacity: 10)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    raise "Station is Full." if full?
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
