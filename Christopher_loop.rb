array = ["zero","one","two"]

class Something

def initialize(array)
 @array = array
end

def run
 puts "Enter Input: "
 input = gets.chomp

 while input != "quit"
     if input == "0"
       puts @array[0]
     elsif input == "1"
       puts @array[1]
     elsif input == "2"
       puts @array[2]
     else
       break
       end
     puts "Enter Input: "
     input = gets.chomp
   end

end


end

test = Something.new(array)

test.run