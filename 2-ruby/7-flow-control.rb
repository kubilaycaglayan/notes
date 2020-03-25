def yaz(n)
    puts "a" + n.to_s
end

i_am_hungry = true
if i_am_hungry
    puts "I will eat"
end

i_am_hungry = false
unless i_am_hungry
    puts "I will not eat"
end

# one line expressions

puts "1" if true
if true then yaz(1) end
if false then yaz(2) else yaz(3) end
if false
    yaz(4) else yaz(5) end

# The Spaceship Operator <=>
puts "spaceship"
puts 1 <=> 1 # equals 0
puts 1 <=> 2 # smaller -1
puts 2 <=> 1 # greater 1

# Chaining comparisons

puts true && false
puts true || false
puts !true

# Interesting fact / ruby stops evaluating once it's enough
# Moreover, it returns the last evaluated thing

puts("this isn't important") && puts("THIS IS IMPORTANT!!!")
puts("this isn't important") || puts("THIS IS IMPORTANT!!!")

puts "----"

if 4
    puts "4 is truthy"
end

if puts("this isn't important")
else
    puts "puts is nil"
end

# ||= if it hasn't been assigned yet

new_variable ||= "Let there be ligt!" # gonna happen, bcs new_variable was nill
puts new_variable

new_variable ||= "Let there be light change!" # it's not gonna happen
puts new_variable

# Ternary operator

true ? yaz(1) : "No it's not true"

# Cases
madde = 1
case madde
when 1
    puts "case güzel"
when 2
    puts "case hoş"
when 3
    puts "case akıcı"
when 4
    puts "case kolay"
when 5
    puts "case okunaklı"
else
    puts "yukarıdakilerin hepsi"
end