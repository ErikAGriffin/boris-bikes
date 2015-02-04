require 'Van'

describe Van do

	let(:brokenBike) {double :bike, broken?: true, fix!: :workingBike}
  let(:workingBike) {double :bike, broken?: false, break!: :brokenBike}
  let(:dock) {double :dockingStation}

  let(:van) {Van.new}


  def fill_container(container)
    container.capacity.times {container.dock(workingBike)}
  end


  def transfer_broken_bikes


  end

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


  it 'should travel to dock station' do
    van.travel_to(dock)
    expect(van.location).to eq(dock)
  end

  it 'should travel to garage' do
    van.travel_to(dock)
    van.travel_to('garage')
    expect(van.location).to eq('garage')
  end

  it 'should take broken bikes from station to garage' do

  end



end
