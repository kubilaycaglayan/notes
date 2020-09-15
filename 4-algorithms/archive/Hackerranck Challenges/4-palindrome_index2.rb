def palindrome?(string)
  string == string.reverse
end

def delete_char(string, n)
  string[n] = ''
  string
end

def palindromeIndex(s)
  return -1 if palindrome?(s)

  index = 0
  left = false
  right = false
  (s.size / 2 + 1).times do |round|
    left = true
    rigth = false
    index = round
    temporary_string = s.clone
    temporary_string = delete_char(temporary_string, round)
    break if palindrome?(temporary_string)

    left = false
    rigth = true
    temporary_string = s.clone
    temporary_string = delete_char(temporary_string, s.size - round)
    break if palindrome?(temporary_string)
  end
  p '--'
  p right
  p left
  p '--'
  case index
  when (s.size / 2) && !palindrome?(s)
    -1
  else
    index if left == true
    s.size - index if right == true
  end
end

strings = %w[aaab baa aaa acaaaa]

strings.each do |string|
  p palindromeIndex(string)
end
