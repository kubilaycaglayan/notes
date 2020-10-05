def sort_itself(array)
  for i in 1...array.length
    current_value = array[i]
    j = i - 1
    # iteration
      # => it will stop if there's no more spot to go on
      # => it will stop if the first element on my checklist is not greater than my current element
      # => it wil go through back step by step
      # => I want to switch elements to the next spot if they are greater than my current value

    while j >= 0 && current_value < array[j]
      # there are two facts here
      # 1 => there's at least one spot to check(when going backwards)
      # 2 => the element I am checking right now is greater than my current element
      array[j + 1] = array[j]

      j -= 1
    end
    array[j + 1] = current_value
    puts array.join(' ')
  end
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9