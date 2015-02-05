require 'garage'

describe Garage do


  let(:garage) {Garage.new}
  let(:broken_bike) {double :bike, broken?: true, fix!: :working_bike}
  let(:working_bike) {double :bike, broken?: false, break!: :broken_bike}
  let(:station) {double :dockingstation}


 def fill_container(container)
    container.capacity.times {container.dock(working_bike)}
  end

  it 'should accept bikes' do
    expect(garage.bike_count).to eq(0)
    garage.dock(working_bike)
    expect(garage.bike_count).to eq(1)

  end

  it 'should release a bike' do
  	garage.dock(working_bike)
  	garage.release(working_bike)
  	expect(garage.bike_count).to eq(0)
  end

  it 'should know when it\'s full' do
  	expect(garage).not_to be_full
  	fill_container garage
  	expect(garage).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_container garage
    expect{garage.dock(working_bike)}.to raise_error(RuntimeError, 'Garage is Full')
  end

  it 'should show available bikes' do
    garage.dock(working_bike)
    garage.dock(broken_bike)
    expect(garage.available_bikes).to eq([working_bike])

  end

  it 'should show broken bikes' do
    garage.dock(working_bike)
    garage.dock(broken_bike)
    expect(garage.broken_bikes).to eq([broken_bike])
  end



end
