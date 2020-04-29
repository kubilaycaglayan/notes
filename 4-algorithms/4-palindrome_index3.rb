def palindrome?(string)
  string == string.reverse
end

def delete_char(string, n)
  string[n] = ""
  string
end

def palindromeIndex(s)
  return -1 if palindrome?(s)
  
  result = ""
  half_size = s.size / 2
  right = false
  half_size.times do |index|
    right = false
    temp_string = s.clone
    result = index
    break if palindrome?(delete_char(temp_string, index))
    temp_string = s.clone
    right = true
    break if palindrome?(delete_char(temp_string, (s.size - index - 1)))
  end
  return result unless right
  s.size - 1 - result if right
end







strings = ['aaab', 'baa', 'aaa', 'acaaaa']
results = [3,0,-1,1]

strings.each_with_index do |string, index| 
  print "#{index}. case : "
  print "(" + palindromeIndex(string).to_s + ")"
  print " FALSE (#{results [index]})" unless palindromeIndex(string) == results [index]
  print "\n"
end