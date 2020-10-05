class MergeSort
  def initialize(array)
    @array = array.clone
  end
end

def merge_sort(arr1, arr2)
  result = []
  i, j = 0, 0

  while i <= (arr1.length - 1) || j <= (arr2.length - 1)
    # print "i: #{i}, j: #{j}\n"
    first, second = arr1[i], arr2[j]

    if second.nil? || (!first.nil? && first < second)
      result << first
      i += 1
    elsif first.nil? || second < first
      result << second
      j += 1
    end
  end

  result
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]