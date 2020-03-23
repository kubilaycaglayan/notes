n = 0
holy_array = ["j","a","m",["i"],"l",1,"@"]

loop do
    n += 1
    print n.to_s + " "
    break if n == 5
end

while true
    print 1
    break
end

for n in (5..9)
    print n
end
puts ""
for element in holy_array
    print element
end
puts ""
# EACH
holy_array.each do |name_whatever_you_want|
    print name_whatever_you_want
end
puts ""
# TIMES
6.times do |n|
    print "#{n+1}. jump! "
end
puts ""
# UPTO
1.upto(6) do |n|
    print "#{n}. run! "
end
puts ""
# DOWN TO
6.downto(1) do |n|
    next if n == 2
    print "#{n} "
    break if n == 1
end

# break
# next 
# redo => restarts the loop (without evaluating the condition on the first go-through)
# retry =>

