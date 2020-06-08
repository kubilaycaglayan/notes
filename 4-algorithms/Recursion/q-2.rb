# Define a recursive function that returns true if a string is a palindrome and false otherwise.

def palindrome?(string)
  p string
  return true if string.size == 0
  string = string.split('')
  return false unless string.pop == palindrome?(string.join)

  string.shift
end

p palindrome?('aa')