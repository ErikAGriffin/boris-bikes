require 'bike'

describe Bike do

  let(:theBike) {Bike.new}

  it 'should not be initially broken upon creation' do
    expect(theBike).not_to be_broken
    # bike.broken?.should be (false)

  end

	it 'should be able to break' do
		theBike.break!
		expect(theBike).to be_broken
	end

	it 'should be able to get fixed' do
		theBike.break!
		theBike.fix!
		expect(theBike).not_to be_broken
	end

end
