require 'pry'

class A
  attr_accessor :name
end

a = A.new
a.name = "My name"

sum = '1.'.to_i + '3'.to_i
binding.pry

puts sum

100.times do
  binding.pry
end