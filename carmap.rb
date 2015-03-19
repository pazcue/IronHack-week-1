class Car
	
	def initialize(make, sound)
		@make = make	
		@sound = sound
	end
	
	def honk
	puts @sound
	end

	def to_s
	 "I am a " + @make + " I go " + @sound 
		
	end
end

sounds = ["Broom", "Meek", "Nyan"]

new_sounds = sounds.map { |sound| Car.new "toyota", sound }
puts new_sounds
