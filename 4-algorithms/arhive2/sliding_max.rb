def sliding_maximum(k, array)
  # p array.each_cons(k).map(&:max)
  subsequence = []
  maxs = []
  array.each do |num|
    subsequence.push(num)
    subsequence.shift if subsequence.size > k
    if subsequence.size == k
      maxs.push(subsequence.max)
    end
  end
  p maxs
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]
