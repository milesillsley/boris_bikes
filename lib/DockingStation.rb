require './lib/Bike'

class DockingStation
	MAX_CAPACITY = 20
  attr_accessor :capacity, :bikes
  #attr_accessor :max_capacity

	def initialize(capacity = MAX_CAPACITY)
		@bikes = []
		@capacity = capacity

	end

private

	def full?
		@bikes.size < @capacity ? true : false
	end

public

	def release
		fail "No bikes to release" unless !@bikes.empty?
		@bikes.pop
	end

	def dock(bike)
		fail "No more space" unless full?
		@bikes << bike
	end

	def inspect

	end

end
