class Car
	def initialize(name)
		@name = name
		@total
	end

	def to_s
		return @name
	end
end

cars = [Car.new('Toyota'), Car.new('Mazerati'), Car.new('Ferrari')]



all_cars = cars.reduce do |total, name| 
	total = "#{total}" + ' ' +"#{name}"
end

p all_cars