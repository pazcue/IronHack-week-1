01-dependency-injection.rb

class Car
  def initialize(engine)
    @engine = engine
  end
 
  def rev
    @engine.rev
    puts 'BOOOM'
  end
end
 
class Engine
  def rev
    puts 'VROOOOMMM'
  end
end
 
hemi = Engine.new
car = Car.new(hemi)
 
# This should make a sound
# and also call Engine#rev
car.rev

02-enumerable.rb

# Create a CarTransport class that contains Cars
# Make CarTransport Enumerable
# (the highest car is the one with more letters in its sound)
# Find the loudest car using .max method
 
 
class Car
  attr_reader(:sound)
 
  def initialize(sound)
    @sound = sound
  end
 
  # Implement a spaceship operator for Enumarable to make comparisons
  def <=>(another_car)
    @sound.length <=> another_car.sound.length
  end
end
 
class CarTransport
  # Include the Enumerable modules
  include Enumerable
 
  def initialize
    @cars = []
  end
 
  # Add cars to the transport
  def park(car)
    @cars.push(car)
  end
 
  # Implement an each method for Enumerable to iterate over items
  def each(&block)
    @cars.each(&block)
  end
end
 
 
first_car = Car.new('short sound')
second_car = Car.new('loooooooooooong sound')
third_car = Car.new('mediummmm sound')
p first_car <=> second_car # -1
p second_car <=> third_car # 1
p first_car <=> first_car # 0
 
 
transport = CarTransport.new
transport.park(first_car)
transport.park(second_car)
transport.park(third_car)
 
# Now we can use any Enumerable method
p transport.max
p transport.map {|car| car.sound }
p transport.reduce('') { |sounds, car| sounds + car.sound }

03-class-variables.rb

# Generic car's schematic
class Car
  attr_reader(:brand)
 
  # Initial values for class variables
  # (this happens only once)
  @@number_of_cars = 0
  @@brands = []
 
  def initialize(brand, sound)
    @brand = brand
    @sound = sound
    @@number_of_cars += 1
 
    if !@@brands.include?(brand)
      @@brands.push(brand)
    end
  end
 
  def rev
    puts @sound + "! I am a " + @brand
  end
 
  def total_cars
    return @@number_of_cars
  end
 
  def brands
    return @@brands
  end
end
 
# Build a car
first_car = Car.new('Ferrari', 'Vrooooom')
first_car = Car.new('Ferrari', 'Vrooooom')
second_car = Car.new('Porsche', 'Put put put')
second_car = Car.new('Porsche', 'Put put put')
second_car = Car.new('Honda', 'pew pew')
second_car = Car.new('Toyota', 'sdfsfsfsfsf')
 
# Use the car
first_car.rev
second_car.rev
 
puts 'TOTAL CARS: ' + second_car.total_cars.to_s
 
puts 'REGISTERED BRANDS: ', second_car.brands


04-class-methods.rb
# Generic car's schematic
class Car
  attr_reader(:brand)
 
  # Initial values for class variables
  # (this happens only once)
  @@number_of_cars = 0
  @@brands = []
 
  def initialize(brand, sound)
    @brand = brand
    @sound = sound
    @@number_of_cars += 1
 
    if !@@brands.include?(brand)
      @@brands.push(brand)
    end
  end
 
  def rev
    puts @sound + "! I am a " + @brand
  end
 
  def other_method
    puts 'HI this is another method'
  end
 
  def self.total_cars
    return @@number_of_cars
  end
 
  def self.brands
    return @@brands
  end
end
 
# Build a car
first_car = Car.new('Ferrari', 'Vrooooom')
first_car = Car.new('Ferrari', 'Vrooooom')
second_car = Car.new('Porsche', 'Put put put')
second_car = Car.new('Porsche', 'Put put put')
second_car = Car.new('Honda', 'pew pew')
second_car = Car.new('Toyota', 'sdfsfsfsfsf')
 
# Use the car
first_car.rev
second_car.rev
 
puts 'TOTAL CARS: ' + Car.total_cars.to_s
 
puts 'REGISTERED BRANDS: ', Car.brands

05-changing-to-files.rb

# Generic car's schematic
class Car
  attr_reader(:brand)
 
  # Initial values for class variables
  # (this happens only once)
  @@brands = []
 
  # Initial value for file
  IO.write('total_cars.txt', 0)
 
  def initialize(brand, sound)
    @brand = brand
    @sound = sound
 
    # Retrieve current value
    current = IO.read('total_cars.txt').to_i
 
    # Write updated value
    IO.write('total_cars.txt', current + 1)
 
    if !@@brands.include?(brand)
      @@brands.push(brand)
    end
  end
 
  def rev
    puts @sound + "! I am a " + @brand
  end
 
  def other_method
    puts 'HI this is another method'
  end
 
  def self.total_cars
    return IO.read('total_cars.txt').to_i
  end
 
  def self.brands
    return @@brands
  end
end
 
 
 
################################
# Application code starts here #
################################
 
# Build a car
first_car = Car.new('Ferrari', 'Vrooooom')
first_car = Car.new('Ferrari', 'Vrooooom')
second_car = Car.new('Porsche', 'Put put put')
second_car = Car.new('Porsche', 'Put put put')
second_car = Car.new('Honda', 'pew pew')
second_car = Car.new('Toyota', 'sdfsfsfsfsf')
 
# Use the car
first_car.rev
second_car.rev
 
puts 'TOTAL CARS: ' + Car.total_cars.to_s
 
puts 'REGISTERED BRANDS: ', Car.brands
 

06-inheritence.rb

# Generic car's schematic
class Car
  attr_reader(:brand)
 
  # Initial values for class variables
  # (this happens only once)
  @@brands = []
 
  # Initial value for file
  IO.write('total_cars.txt', 0)
 
  def initialize(brand, sound)
    @brand = brand
    @sound = sound
 
    # Retrieve current value
    current = IO.read('total_cars.txt').to_i
 
    # Write updated value
    IO.write('total_cars.txt', current + 1)
 
    if !@@brands.include?(brand)
      @@brands.push(brand)
    end
  end
 
  def rev
    puts @sound + "! I am a " + @brand
  end
 
  def other_method
    puts 'HI this is another method'
  end
 
  def self.total_cars
    return IO.read('total_cars.txt').to_i
  end
 
  def self.brands
    return @@brands
  end
end
 
 
class RacingCar < Car
  def initialize(brand, sound)
    super(brand, sound)
    @sound = sound.upcase
  end
 
  # def rev
  #   puts @sound.upcase + "! I am a " + @brand
  # end
end
 
 
################################
# Application code starts here #
################################
 
# Build a car
first_car = RacingCar.new('Ferrari', 'Vrooooom')
second_car = RacingCar.new('Mazerati', 'VRRrrrraaa??')
third_car = RacingCar.new('Porsche', 'Put put put')
fourth_car = RacingCar.new('Porsche', 'Pat pat pat')
fifth_car = Car.new('Honda', 'pew pew')
sixth_car = Car.new('Toyota', 'sdfsfsfsfsf')
 
# Use the car
first_car.rev
second_car.rev
third_car.rev
fourth_car.rev
fifth_car.rev
sixth_car.rev
 
puts ''
puts 'TOTAL CARS: ' + Car.total_cars.to_s
 
puts 'REGISTERED BRANDS: ', Car.brands


