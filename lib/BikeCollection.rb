class BikeCollection


  include Enumerable


  def initialize
    @bikes = []
  end

  def each
    for i in 0..@bikes.length
      yield @bikes[i]
    end
  end


    def add_bike(bike)
      @bikes << bike
    end

  def bike_count
    @bikes.count
  end

  def delete(bike)
  end


end