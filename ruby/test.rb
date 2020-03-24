array = [1,2,3,4]
array2 = ["asd", "qwe", 1]

#array2.delete_at(1)

string = ""

array2.each do |x|
   string << x.to_s
end

puts string

puts "----"

print %w{ asd a sd  asdadsa }
puts ""
puts array2.join

print string.split(" ")