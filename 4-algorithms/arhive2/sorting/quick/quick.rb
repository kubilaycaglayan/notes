@count = 0

def quick(array)
  return [] if array.empty?
  return array if array.length == 1

  pivot = array[0]
  left = []
  right = []

  for i in 1...array.length # n
    @count += 1
    if array[i] <= pivot
      left << array[i]
    else
      right << array[i]
    end
  end

  quick(left) + [pivot] + quick(right) # log n
end

numbers = (0..10).to_a.reverse
numbers2 = (0..100).to_a.reverse

p numbers
p quick numbers
p @count

@count = 0
p quick numbers2
p @count
