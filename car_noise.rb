class Car
	
	def initialize(make, sound)
		@make = make	
		@sound = sound
	end
	
	def honk
	puts @sound
	end

end

Ford = Car.new "Ford", "ClunkyClunk"
Toyota = Car.new "Toyota", "I'm Japanese"
Ferrari = Car.new "Ferrari", "I'm really expensive"

car_array =[Ford, Toyota, Ferrari]

car_array.each do |car| 
	car.honk
end