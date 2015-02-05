require 'Van'

describe Van do

	let(:broken_bike) {double :bike, broken?: true, fix!: :working_bike}
  let(:working_bike) {double :bike, broken?: false, break!: :broken_bike}
  let(:station) {double :dockingStation}
  let(:stackedDock) {double :dockingStation, broken_bikes: [broken_bike]}

  let(:van) {Van.new}


  def fill_container(container)
    container.capacity.times {container.dock(working_bike)}
  end




  it 'should hold bikes' do
  	expect(van.bike_count).to eq(0)
  	van.dock(working_bike)
  	expect(van.bike_count).to eq(1)
  end

  it 'should release bikes' do
    van.dock(working_bike)
    van.release(working_bike)
    expect(van.bike_count).to eq(0)
  end


  it 'should travel to dock station' do
    van.travel_to(station)
    expect(van.location).to eq(station)
  end

  it 'should travel to garage' do
    van.travel_to(station)
    van.travel_to('garage')
    expect(van.location).to eq('garage')
  end

  it 'should take broken bikes from station' do
    broken_bike = double :bike, broken?: true
    station     = double :station, broken_bikes: [broken_bike], release: broken_bike

    expect(station).to receive(:release).with(broken_bike)
    van.collect_broken_bikes_from station
    expect(van.broken_bikes).to eq([broken_bike])
  end

  it 'should unload brokenbikes at garage' do
    # van garage, broken bike
    # You don't have to add methods here, using expect rspec runs properly
    garage = double :garage, dock: broken_bike

    van.dock(broken_bike)

    # Expect always comes before message send
    # When testing communication
    expect(garage).to receive(:dock).with(broken_bike)

    van.unload_broken_bikes_to(garage)


    expect(van.broken_bikes).to eq([])


  end









end
