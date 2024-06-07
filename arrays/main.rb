require_relative 'vector.rb'

vector = Vector.new
puts vector.empty?
puts vector.size

vector.push_back(1)
vector.push_back(2)
vector.push_back(3)
vector.push_front(0)
vector.push_front(-1)

print vector.vec
puts

vector.insert_at(2, 0.5)
vector.insert_at(5, 5)
vector.insert_at(5, 3.5)
print vector.vec
puts

puts "value 0 is located at index #{vector.find(0)}"
puts "value 7 is located at index #{vector.find(7)}"

puts "Reset the vector"
vector.clear

puts "size after reset: #{vector.size}"

vector.push_back(1)
vector.push_front(0)

print vector.vec
puts
puts vector.size