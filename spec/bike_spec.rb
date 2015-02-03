require 'bike'

describe Bike do


  it 'should not be initially broken upon creation' do
    theBike = Bike.new

    expect(theBike).not_to be_broken
    # bike.broken?.should be (false)

  end


end
