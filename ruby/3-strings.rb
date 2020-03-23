begin
    puts I confuse ruby
rescue => exception
    puts "This is the error: " + exception.to_s
    puts "I do not"
end

my_long_string = "And she said, 'Cool program!'"
puts my_long_string

def greeting name, age
    puts "I think #{name}, this interpolation feature is awesome in Ruby. What do you think? Since you are #{age} years old, you should be experienced about these things."
    puts 'I think #{name}, this interpolation feature is awesome in Ruby. What do you think? Since you are #{age} years old, you should be experienced about these things.'
end

greeting("Kubilay", 28)

now = "RIGHT NOW"
puts "interpolating #{now} but not \#{now}"

puts "------------"

string = "0123456789"

puts string[0]
puts string[1]
puts string[0,2] # 0'dan başla iki git
puts string[0..9]
puts string[0..-1]
puts string[1..-2]
puts string[3,5] # 3'den başla 5 git

puts "---------"

list = "eggs, milk, cheese and crackers"
print list.split(", ").to_s + "\n"
print list.split(" ").to_s + "\n"
print list.split(//).to_s + "\n"

#input = gets.chomp
#p input

directory = `ls` #Strings made with the backtick characters ` are actually interpolated and run by your operating system
p directory # funny

puts "--------"

puts "hello".gsub("l", "r")