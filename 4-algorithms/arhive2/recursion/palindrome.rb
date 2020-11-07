def palindrome?(string)
  if string.size == 0 || string.size == 1
    return true
  else
    if string[0] == string[-1]
      palindrome?(string[1..-2])
    else
      false
    end
  end
end

p palindrome?('yasin')
p palindrome?('yasay')
p palindrome?('yasa')
p palindrome?('yaay')
p palindrome?('')
p palindrome?('a')