def palindromeIndex(string)
  return -1 if string == string.reverse

  reversed = string.reverse.clone

  string.size.times do |index|
    next if string[index] == reversed[index]

    temporary_string = string.clone
    temporary_string[index] = ''

    temporary_reversed = reversed.clone
    temporary_reversed[temporary_reversed.size - 1 - index] = ''

    return index if temporary_string == temporary_reversed
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
