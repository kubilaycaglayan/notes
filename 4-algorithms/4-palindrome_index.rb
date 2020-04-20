def palindromeIndex(string)
  return -1 if string == string.reverse
  palindrome = false
  index = 0
  until palindrome
    string_clone = string.clone
    string_clone[index] = ""
    palindrome = true if string_clone == string_clone.reverse
    index += 1
    break if index == string.size
  end
  palindrome ? (index - 1) : -1
end

input = ['aaab',
  'baa',
  'aaa',
'acaaaa']
results = [3,0,-1,1]

input.each_with_index do |string, index|
  p palindromeIndex(string) == results[index]
end