require 'DockingStation'


describe DockingStation do


  describe "setting capacity" do

    it "sets the default to 20 if no capacity is specified" do
      expect(subject.capacity).to eq DockingStation::MAX_CAPACITY
    end

    it "has a variable capacity" do
      station = DockingStation.new(15)
      15.times { station.dock Bike.new }
      expect { station.dock Bike.new }.to raise_error "No more space"
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
    it "only releases working bikes" do
      bike = Bike.new
      subject.dock_broken(bike)
      expect { subject.release }.to raise_error "No bikes to release"
    end

  end


  describe "#dock & #dock_broken" do

    bike = Bike.new
    it "docks a bike at a docking station" do
      expect(subject.dock(bike)).to eq([bike])
    end

    it "won't accept more bikes than station's maximum capacity which is 20 bikes" do
    	subject.capacity.times{ subject.dock(bike) }
    	expect { subject.dock(bike) }.to raise_error "No more space"
	  end

    it "is able to dock and report a broken bike" do
      station = DockingStation.new
      station.dock_broken(Bike.new)
      broken_bike = station.release
      expect(broken_bike.working?).to eq(false)
    end

  end

end
