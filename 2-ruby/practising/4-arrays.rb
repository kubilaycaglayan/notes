puts a = [] # 1
puts b = []
puts c = Array[]
print d = %w[I am not a crook] # converts the string (no quotes) to an array
puts "\n"
print empty_a = Array.new(5)
puts "\n"
print full_a = Array.new(3, 'hi')
puts ''
print full_a = Array.new(3, [])
puts ''
# BEST PRACTICE IS keep only one type of thing in one array

print [2, 2, 2, 2, 2, 3, 4] - [2, 5, 7]

puts ''
puts 'add, delete elements at the end'
array = [1, 2, 3, 4]
print array.push(5)
puts ''
print array.pop
puts ''
print array
puts ''
puts 'now to the beginning'
print array.shift
puts ''
print array
puts ''
print array.unshift(0)
puts ''
puts 'now delete'
print array.delete_at(2)
puts ''
print array
puts ''
puts 'Bu bunda var mı?'
puts array.include?(2).to_s + ' 2'
puts array.include?(3).to_s + ' 3'
puts 'en çok sevdiğim şey, indexleme: yalnızca ilk gördüldüğü indexi veriyor'
puts [1, 2, 3, 4, 5, 6, 7, 3, 3, 3, 3, 3].index(3)
p [1, 2, 3, 4, 5, 6, 7, 3, 3, 3, 3, 3].index(32)
puts 'boyu kaç?'
puts [1, 2, 3, 4, 5, 6, 7, 3, 3, 3, 3, 3].size
puts 'unique'
print [1, 2, 3, 4, 5, 6, 7, 3, 3, 3, 3, 3].uniq
puts ''
puts 'sort'
print [14, 3, 5, 8, 4, 6, 15, 2, 45, 31, 1].sort
puts ''
puts 'Joining'
print [1, 2, 3, 4, 5].join(' is number ')
puts ''
puts 'create array'
print (1..7).to_a
puts ''
puts 'Extra Feature (sanırım burada x index oluyor)'
print Array.new(5) { |x|
  puts x
}

puts ''
