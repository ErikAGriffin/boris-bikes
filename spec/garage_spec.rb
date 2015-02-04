require 'garage'

describe Garage do


  let(:garage) {Garage.new}
  let(:brokenBike) {double :bike, broken?: true, fix!: :workingBike}
  let(:workingBike) {double :bike, broken?: false, break!: :brokenBike}
  let(:station) {double :dockingstation}


 def fill_container(container)
    container.capacity.times {container.dock(workingBike)}
  end

  it 'should accept bikes' do
    expect(garage.bikeCount).to eq(0)
    garage.dock(workingBike)
    expect(garage.bikeCount).to eq(1)

  end

  it 'should release a bike' do
  	garage.dock(workingBike)
  	garage.release(workingBike)
  	expect(garage.bikeCount).to eq(0)
  end

  it 'should know when it\'s full' do
  	expect(garage).not_to be_full
  	fill_container garage
  	expect(garage).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_container garage
    expect{garage.dock(workingBike)}.to raise_error(RuntimeError, 'Garage is Full')
  end

  it 'should show available bikes' do
    garage.dock(workingBike)
    garage.dock(brokenBike)
    expect(garage.availableBikes).to eq([workingBike])

  end

  it 'should show broken bikes' do
    garage.dock(workingBike)
    garage.dock(brokenBike)
    expect(garage.brokenBikes).to eq([brokenBike])
  end



end
