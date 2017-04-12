class Bike
attr_accessor :docked, :condition

	def initialize
		@condition = true
		@docked = true
	end

	def working?
		@condition
	end

end
