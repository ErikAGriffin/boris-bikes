require 'DockingStation'

describe DockingStation do

  let(:bike) {double :bike}
  let(:station) {DockingStation.new(capacity: 20)}

  def fill_station(station)
    20.times { station.dock(Bike.new) }
  end

  it 'should accept bikes' do
    expect(station.bikeCount).to eq(0)
    station.dock(bike)
    expect(station.bikeCount).to eq(1)

  end

  it 'should release a bike' do
  	station.dock(bike)
  	station.release(bike)
  	expect(station.bikeCount).to eq(0)
  end

  it 'should know when it\'s full' do
  	expect(station).not_to be_full
  	fill_station station
  	expect(station).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_station station
    expect(lambda {station.dock(bike)}).to raise_error(RuntimeError, 'Station is Full.')
  end

end

