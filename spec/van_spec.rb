require 'Van'

describe Van do

	let(:brokenBike) {double :bike, broken?: true, fix!: :workingBike}
  let(:workingBike) {double :bike, broken?: false, break!: :brokenBike}
  let(:dockingStation) {double :dockingStation}

  let(:van) {Van.new}



  it 'should hold bikes' do
  	expect(van.bikeCount).to eq(0)
  	van.dock(workingBike)
  	expect(van.bikeCount).to eq(1)
  end

  it 'should release bikes' do
    van.dock(workingBike)
    van.release(workingBike)
    expect(van.bikeCount).to eq(0)
  end

  it 'starts at garage' do
    expect(van.location).to eq('garage')
  end

  it 'travel to dock station' do
    van.travel_to(dockingStation)
    expect(van.location).to eq(dockingStation)
  end

  it 'travel to garage' do
    van.travel_to(dockingStation)
    van.travel_to('garage')
    expect(van.location).to eq('garage')
  end


end
