input = []
output = []

input.each_with_index do |string, index|
  print "#{index + 1}. case : "
  print function(string)
  print " FALSE (#{output [index]})" unless function(string) == output [index]
  print "\n"
end
