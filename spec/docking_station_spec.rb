require 'DockingStation'

describe DockingStation do

  let(:brokenBike) {double :bike, broken?: true, fix!: :workingBike}
  let(:workingBike) {double :bike, broken?: false, break!: :brokenBike}
  let(:station) {DockingStation.new(capacity: 20)}

  def fill_station(station)
    20.times { station.dock(Bike.new) }
  end

  it 'should accept bikes' do
    expect(station.bikeCount).to eq(0)
    station.dock(workingBike)
    expect(station.bikeCount).to eq(1)

  end

  it 'should release a bike' do
  	station.dock(workingBike)
  	station.release(workingBike)
  	expect(station.bikeCount).to eq(0)
  end

  it 'should know when it\'s full' do
  	expect(station).not_to be_full
  	fill_station station
  	expect(station).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_station station
    expect(lambda {station.dock(workingBike)}).to raise_error(RuntimeError, 'Station is Full')
  end

  it 'should show available bikes' do
    station.dock(workingBike)
    station.dock(brokenBike)
    expect(station.availableBikes).to eq([workingBike])

  end

end

