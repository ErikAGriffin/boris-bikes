require 'BikeCollection'
class BikeContainer

  attr_reader :bikes

  def initialize(capacity: 10)
    @capacity = capacity
    @bikes = BikeCollection.new
  end

  def capacity
    @capacity
  end

  def dock (bike)
    raise "Container is Full" if full?
    @bikes.add_bike(bike)
  end

  def bike_count
    @bikes.bike_count
  end

  def release(bike)
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    @bikes.select { |bike| !bike.broken? }
  end

  def broken_bikes
    @bikes.select { |bike| bike.broken? }
  end




end


