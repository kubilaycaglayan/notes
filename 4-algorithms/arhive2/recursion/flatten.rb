def flatten(arr, result = [])
  arr.each do |element|
    if element.class == Array
      flatten(element, result)
    else
      result << element
    end
  end
  result
end

p flatten [[1, 2], [3, 4]]
p flatten [[1, [8, 9]], [3, 4]]
p flatten [[1, [8, 9]], [3, 4], [[[[[[[[15]]]]]]]]]
p [[1, [8, 9]], [3, 4], [[[[[[[[15]]]]]]]]].flatten