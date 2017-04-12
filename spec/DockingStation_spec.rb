require 'DockingStation'


describe DockingStation do

  describe "setting capacity" do
    it "takes a value for capacity" do
      endexpect(subject(15)).capacity.to eq(15)
    end
    it "sets the default to 20 if no capacity is specified" do
      expect(subject).capacity.to eq(20)
    end
  end


  describe '#release' do

    it "raises error when there are no bikes to be released" do
      expect { subject.release }.to raise_error "No bikes to release"
    end
    it "a) gets a bike, and then b) expects the bike to be working" do
		  bike = Bike.new
		  subject.bikes << bike
		  expect(subject.release.working?).to eq(true)
	  end

  end


  describe "#dock" do

    bike = Bike.new
    it "docks a bike at a docking station" do
      expect(subject.dock(bike)).to eq([bike])
    end

    it "won't accept more bikes than station's maximum capacity which is 20 bikes" do
    	MAX_CAPACITY.times{ bike = Bike.new
    	subject.bikes << bike }
    	expect{subject.dock(bike)}.to raise_error "No more space"
	  end

  end

end
