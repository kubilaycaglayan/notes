strings = ['aaab', 'baa', 'aaa', 'acaaaa']
results = [3,0,-1,1]

strings.each_with_index do |string, index| 
  print "#{index}. case : "
  print palindromeIndex(string)
  print " FALSE (#{results [index]})" unless palindromeIndex(string) == results [index]
  print "\n"
end