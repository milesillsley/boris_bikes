require './lib/Bike'

class DockingStation
	MAX_CAPACITY = 20
  attr_accessor :capacity, :bikes


	def initialize(capacity = MAX_CAPACITY)
		@bikes = []
		@workingbikes = []
		@capacity = capacity

	end

#private

	def full?
		@bikes.count >= @capacity
	end

	def empty?
		@workingbikes.empty?
	end

public

	def release
		fail "No bikes to release" if empty?
		@workingbikes.pop
	end

	def dock(bike)
		fail "No more space" if full?
		@workingbikes << bike if bike.working?
		@bikes << bike
	end

	def dock_broken(bike)
		fail "No more space" if full?
		bike.condition = false
		@bikes << bike
	end


end
