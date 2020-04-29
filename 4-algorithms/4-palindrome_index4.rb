def palindrome?(string, reversed_string)
  string == reversed_string
end

def delete_char(string, n)
  #p "#{n} string: #{string}" if n > string.size
  string[n] = ""
  string
end

def palindromeIndex(s)
  reversed_string_original = s.reverse
  return -1 if palindrome?(s, reversed_string_original)


  result = ""
  half_size = s.size / 2

  left = true
  right = false
  left_last = false
  right_first = false

  half_size.times do |index|
    #p index
    result = index
    left = true
    temp_string = s.clone
    reversed_string = reversed_string_original.clone
    break if palindrome?(delete_char(temp_string, index), delete_char(reversed_string, s.size - 1 - index))

    left = false
    right = true
    temp_string = s.clone
    reversed_string = reversed_string_original.clone
    break if palindrome?(delete_char(temp_string, (s.size - index - 1)), delete_char(reversed_string, index))

    right = false
    left_last = true
    temp_string = s.clone
    reversed_string = reversed_string_original.clone
    break if palindrome?(delete_char(temp_string, (half_size - index)), delete_char(reversed_string, (half_size + index)))

    left_last = false
    right_first = true
    temp_string = s.clone
    reversed_string = reversed_string_original.clone
    break if palindrome?(delete_char(temp_string, (half_size + index)), delete_char(reversed_string, (half_size - index)))

    right_first = false
  end

  return result if left
  return (s.size - 1 - result) if right
  return (half_size - result) if left_last
  return (half_size + result) if right_first
end





long_string = 'a' * 10**5
long_string[25000] = 's'

strings = ['aaab', 'baa', 'aaa', 'acaaaa', 'asddlsa' , long_string]
results = [3,0,-1,1, 4, 25000]

strings.each_with_index do |string, index| 
  start = Time.now
  result = palindromeIndex(string)
  cpu_time = (Time.now - start).round(2)
  print "#{index}. case : "
  print "(" + result.to_s + ")"
  print " FALSE (#{results [index]})" unless result == results [index]
  print " CPU-TIME: " + cpu_time.to_s
  print "\n"
end