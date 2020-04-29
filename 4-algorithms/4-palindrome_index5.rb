def palindrome?(string, reversed_string)
  string == reversed_string
end

def delete_char(string, n)
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

  first_time = 0
  second_time = 0
  third_time = 0
  fourth_time = 0

  half_size.times do |index|
    #p index
    result = index
    left = true

    
    temp_string = s.clone


    start = Time.now
    reversed_string = reversed_string_original.clone



    start = Time.now

    #temp_string[index] = ''
    temp_string = temp_string[0...index] + temp_string[(index + 1)...(index.size - 1)]


    cpu_time = (Time.now - start) * 10.round(2)
    first_time = first_time + cpu_time
    #p "1. cpu time : #{cpu_time}"

    start = Time.now

    side_a = temp_string

    cpu_time = (Time.now - start) * 10.round(2)
    second_time = second_time + cpu_time
    #p "2. cpu time : #{cpu_time}"

    
    start = Time.now

    side_b = delete_char(reversed_string, s.size - 1 - index)

    cpu_time = (Time.now - start) * 10.round(2)
    third_time = third_time + cpu_time
    #p "3. cpu time : #{cpu_time}"

    start = Time.now
    break if palindrome?(side_a, side_b)
    cpu_time = (Time.now - start) * 10.round(2)
    fourth_time = fourth_time + cpu_time
    #p "4. cpu time : #{cpu_time}"


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
    #break
  end

  p "first: #{first_time}"
  p "second: #{second_time}"
  p "third: #{third_time}"
  p "fourth: #{fourth_time}"

  return result if left
  return (s.size - 1 - result) if right
  return (half_size - result) if left_last
  return (half_size + result) if right_first
end





long_string = 'a' * 10**5
long_string[25000] = 's'

strings = [long_string]
results = [25000]

strings.each_with_index do |string, index| 
  start = Time.now
  result = palindromeIndex(string)
  cpu_time = (Time.now - start).round(2)
  print "===== #{index}. CASE :"
  #print "(" + result.to_s + ")"
  #print " FALSE (#{results [index]})" unless result == results [index]
  print " CPU-TIME: " + cpu_time.to_s
  print "\n"
end