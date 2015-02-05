require 'bike'

describe Bike do

  let(:the_bike) {Bike.new}

  it 'should not be initially broken upon creation' do
    expect(the_bike).not_to be_broken
    # bike.broken?.should be (false)

  end

	it 'should be able to break' do
		the_bike.break!
		expect(the_bike).to be_broken
	end

	it 'should be able to get fixed' do
		the_bike.break!
		the_bike.fix!
		expect(the_bike).not_to be_broken
	end

end
