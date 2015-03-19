class Car
  IO.read('total_cars.txt')

  def initialize(model)
  	@model = model
    IO.write('total_cars.txt') + 1
  end

  def honk
    puts "Vroom"
  end

  def honk2
    puts "Bureung"
  end

  def print_model
  	puts @model
  end

  def print_total
    puts "We've got IO.read('total_cars.txt') cars."
  end
end

Ferrari = Car.new "Ferrari"
Porsche = Car.new "Porsche"
