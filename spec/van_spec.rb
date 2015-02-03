require 'Van'

describe Van do 

	let(:brokenBike) {double :bike, broken?: true, fix!: :workingBike}
  let(:workingBike) {double :bike, broken?: false, break!: :brokenBike}
  let(:van) {Van.new}

  it 'should hold bikes' do
  	expect(van.bikeCount).to eq(0)
  	van.dock(workingBike)
  	expect(van.bikeCount).to eq(1)
  end
	
end