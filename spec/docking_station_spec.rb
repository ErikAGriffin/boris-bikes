require 'docking_station'


describe DockingStation do 

	let (:bike) {double :bike}
	let(:station) { DockingStation.new(capacity: 20) }
	let(:working_bike) {double :bike, broken?: false }
	let(:broken_bike) {double :bike, broken?: true}


	it 'should accept a bike' do
		expect {station.dock(bike)}.to change{station.bike_count}.by 1
	end

	it 'should release a bike' do
		station.dock(bike)
		expect{station.release(bike)}.to change{station.bike_count}.by -1
	end


	it 'should know when it\'s full' do
		expect(station).not_to be_full
		20.times { station.dock(bike) }
		expect(station).to be_full
	end

	it 'should not accept a bike if it\'s full' do
		20.times { station.dock(bike) }
		expect{ station.dock(bike) }.to raise_error(RuntimeError, 'Station is full')
	end

	it 'should provide the list of available bikes' do
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end

end