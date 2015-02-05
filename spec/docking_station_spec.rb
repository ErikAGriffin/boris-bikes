require 'DockingStation'

describe DockingStation do

  let(:broken_bike) {double :bike, broken?: true, fix!: :working_bike}
  let(:working_bike) {double :bike, broken?: false, break!: :broken_bike}
  let(:station) {DockingStation.new(capacity: 20)}


 def fill_container(container)
    container.capacity.times {container.dock(working_bike)}
  end

  it 'should accept bikes' do
    expect(station.bikeCount).to eq(0)
    station.dock(working_bike)
    expect(station.bikeCount).to eq(1)

  end

  it 'should release a bike' do
  	station.dock(working_bike)
  	station.release(working_bike)
  	expect(station.bikeCount).to eq(0)
  end

  it 'should know when it\'s full' do
  	expect(station).not_to be_full
  	fill_container station
  	expect(station).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_container station
    expect{station.dock(working_bike)}.to raise_error(RuntimeError, 'Station is Full')
  end

  it 'should show available bikes' do
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.availableBikes).to eq([working_bike])

  end

  it 'should show broken bikes' do
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.broken_bikes).to eq([broken_bike])
  end

end
