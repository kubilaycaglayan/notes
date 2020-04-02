a = 'a'
b = 'b'

change = true

a = 'changed' if change

puts a

change && a = 'changed again'

puts a

save_the_kid = false

save_the_kid || (puts 'This is so bad!')