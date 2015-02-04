require 'garage'

describe Garage do 

	let (:bike) {double :bike}
	let(:garage) { Garage.new(capacity: 80) }
	let(:working_bike) {double :bike, broken?: false }
	let(:broken_bike) {double :bike, broken?: true}


	def fill_container
		garage.capacity.times { garage.dock(bike) }
	end





	it 'should accept a bike' do
		expect {garage.dock(bike)}.to change{garage.bike_count}.by 1
	end

	it 'should release a bike' do
		garage.dock(bike)
		expect{garage.release(bike)}.to change{garage.bike_count}.by -1
	end


	it 'should know when it\'s full' do
		expect(garage).not_to be_full
		fill_container
		expect(garage).to be_full
	end

		it 'should not accept a bike if it\'s full' do
		fill_container
		expect{ garage.dock(bike) }.to raise_error(RuntimeError, 'Garage is full')
	end

	it 'should provide the list of available bikes' do
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq([working_bike])
	end




end
