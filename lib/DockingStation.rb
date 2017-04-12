require './lib/Bike'

class DockingStation
	MAX_CAPACITY = 20
  attr_accessor :capacity, :bikes


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

	def dock_broken(bike)
		fail "No more space" unless full?
		bike.condition = false
		@bikes << bike
	end


end
