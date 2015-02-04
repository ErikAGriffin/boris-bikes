require 'van'

describe Van do


  let (:bike) {double :bike}
  let (:garage) {double :garage}
  let(:van) { Van.new(capacity: 15) }
	let(:working_bike) {double :bike, broken?: false }
	let(:broken_bike) {double :bike, broken?: true}
  let (:dock) {double :dockingstation, broken_bikes: [broken_bike]}



	def fill_container
		van.capacity.times { van.dock(bike) }
	end

  def load_broken_bikes
    if !dock.broken_bikes.empty?
      dock.broken_bikes.each do |bike|
        van.dock(bike)
        dock.delete(bike)
      end
    end
  end

  ## Testing start

	it 'should accept a bike' do
		expect {van.dock(bike)}.to change{van.bike_count}.by 1
	end

	it 'should release a bike' do
		van.dock(bike)
		expect{van.release(bike)}.to change{van.bike_count}.by -1
	end


	it 'should know when it\'s full' do
		expect(van).not_to be_full
		fill_container
		expect(van).to be_full
	end

		it 'should not accept a bike if it\'s full' do
		fill_container
      expect{ van.dock(bike) }.to raise_error(RuntimeError, 'Van is full')
	end

	it 'should provide the list of available bikes' do
		van.dock(working_bike)
		van.dock(broken_bike)
		expect(van.available_bikes).to eq([working_bike])
	end

  it 'should provide a list of broken bikes' do
    van.dock(working_bike)
    van.dock(broken_bike)
    expect(van.broken_bikes).to eq([broken_bike])
  end

  it 'should be able to travel' do
    van.travel_to(dock)
    expect(van.location).to eq(dock)
    van.travel_to(garage)
    expect(van.location).to eq(garage)
  end

  it 'should accept broken bikes from docks' do
    van.travel_to(dock)
    load_broken_bikes
  end





end


