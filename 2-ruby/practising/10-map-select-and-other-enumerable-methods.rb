holy_array = ["ben", "sen", "o", "biz", "siz", "onlar"]
#EACH
holy_array.each_with_index do
    |x, index| print x, index
end

puts ""
# SELECT selects if condition returns true
result = holy_array.select do
    |x| x.length > 3
end
print result
puts ""
# COLLECT  (or MAP)
result = holy_array.collect do
    |x| x[0]
end
print result
puts ""
# INJECT döngünün return ettiği değeri bir sonraki döngüye aktarır
result = holy_array.inject do |sum, n|
    sum + n
end
puts result
# Miscelianous

puts holy_array.any? { |x| x.length > 4}
puts holy_array.all? { |x| x.length > 4}
puts holy_array.none? { |x| x.length > 4}
puts holy_array.find { |x| x.length > 2}
puts holy_array.find { |x| x == "o"}

# GROUP BY

puts holy_array.group_by { |x| x.length}

# REGEX

print holy_array.grep(/b/)
puts ""

# OTHER REGEX WAY

result = holy_array.select do |x|
    /e/ === x
end
print result

