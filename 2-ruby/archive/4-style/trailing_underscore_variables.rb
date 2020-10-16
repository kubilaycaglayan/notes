puts "bad"
foo = 'one,two,three,four,five'
# Unnecessary assignment that does not provide useful information
first, second, _ = foo.split(',')
first, _, _ = foo.split(',')
first, *_ = foo.split(',')

puts "good"
foo = 'one,two,three,four,five'
# The underscores are needed to show that you want all elements
# except for the last number of underscore elements
*beginning, _ = foo.split(',')
*beginning, something, _ = foo.split(',')

a, = foo.split(',')
a, b, = foo.split(',')
# Unnecessary assignment to an unused variable, but the assignment
# provides us with useful information.
first, _second = foo.split(',')
first, _second, = foo.split(',')
first, *_ending = foo.split(',')
