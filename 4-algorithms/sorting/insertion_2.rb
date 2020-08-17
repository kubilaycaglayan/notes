def insertion(array)
  for i in (1..array.length) do
    current_value = array[i]
    last_value = array[i - 1]
  end
end


insertion([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9