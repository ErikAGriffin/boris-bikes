class BikeContainer


	def initialize(capacity: 10)
		@capacity = capacity
		@bikes = []
	end

	def dock(bike)
		raise "Container is full" if full?
		@bikes << bike
	end

	def bike_count
		@bikes.count 
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

	def capacity
		@capacity
	end

end