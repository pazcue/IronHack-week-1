class Car
	def initialize(engine)
	@engine = engine
	end

	def rev
		puts 'Vrooom'
		@engine.rev
	end
end

class Engine

	def rev 
	puts 'Pollute'
	end
end

new_engine = Engine.new

new_car = Car.new(new_engine)
new_car.rev

