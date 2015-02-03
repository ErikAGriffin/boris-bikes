require 'DockingStation'

describe DockingStation do

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new}

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






end

