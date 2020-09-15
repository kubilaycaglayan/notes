# Define a recursive function that returns true if a string is a palindrome and false otherwise.

def palindrome(string)
  if string.size == 0 || string.size == 1
    true
  else
    if string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end

p palindrome('baaab')