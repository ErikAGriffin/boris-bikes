require 'bike'

describe Bike do 

	let(:bike) { Bike.new }
	let(:broken_bike) {Bike.new.break!}
	
	it 'should not be broken after we create it' do
		expect(bike).not_to be_broken
	end

	it 'should be able to break' do
		expect(bike.break!).to be_broken
	end

	it 'should be able to be fixed' do
		expect(broken_bike.fix!).not_to be_broken
	end

end