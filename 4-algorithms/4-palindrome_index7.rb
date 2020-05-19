def palindromeIndex(string)
  return -1 if string == string.reverse

  reversed = string.clone.reverse

  string.size.times do |index|
    next if string[index] == reversed[index]

    temp_string = string.clone
    temp_string[index] = ''
    temp_reversed = reversed.clone
    temp_reversed[string.size - 1 - index] = ''

    return index if temp_reversed == temp_string

    temp_string = string.clone
    temp_string[string.size - 1 - index] = ''
    temp_reversed = reversed.clone
    temp_reversed[index] = ''

    return string.size - 1 - index if temp_reversed == temp_string
    return -1 unless temp_reversed == temp_string
  end
end

long_string = 'a' * (10**5 + 5)
long_string[-1] = 's'

long_string2 = 'a' * 10**5
long_string2[49_000] = 's'

long_string3 = 'a' * 10**5
long_string3[25_000] = 's'

strings = %w[aaab baa aaa acaaaa asddlsa]
results = [3, 0, -1, 1, 4]

strings = ['aaab', 'baa', 'aaa', 'acaaaa', 'asddlsa', long_string, long_string2, long_string3]
results = [3, 0, -1, 1, 4, 100_004, 49_000, 25_000]

strings.each_with_index do |string, index|
  start = Time.now
  result = palindromeIndex(string)
  cpu_time = (Time.now - start).round(2)
  print "===== #{index}. CASE :"
  print '(' + result.to_s + ')'
  print " FALSE (#{results [index]})" unless result == results [index]
  print ' CPU-TIME: ' + cpu_time.to_s
  print "\n"
end
