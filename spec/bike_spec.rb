require 'bike'

describe Bike do


  it 'should not be initially broken upon creation' do
    theBike = Bike.new

    expect(theBike).not_to be_broken
    # bike.broken?.should be (false)

  end

	it 'should be able to break' do
		theBike = Bike.new
		theBike.break!
		expect(theBike).to be_broken
	end

	it 'should be able to get fixed' do
		theBike = Bike.new
		theBike.break!
		theBike.fix!
		expect(theBike).not_to be_broken
	end

end