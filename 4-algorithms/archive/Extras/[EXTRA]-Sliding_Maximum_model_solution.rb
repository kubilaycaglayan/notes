def sliding_maximum(k, array)
  # your code here
  array.each_cons(k).map(&:max)
end