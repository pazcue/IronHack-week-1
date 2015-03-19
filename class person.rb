class Person
	attr_reader :name
	attr_accessor :age
	def initialize(name, age)
		@name = name
		@age = age
	end
end

frank = Person.new('Frank', 40)

puts frank.name, frank.age