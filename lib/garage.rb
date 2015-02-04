require 'bike_container'

class Garage < BikeContainer 

	def dock(bike)
		if full? 
			raise 'Garage is full'
		end
		@bikes << bike
	end


end