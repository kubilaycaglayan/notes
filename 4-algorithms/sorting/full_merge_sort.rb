class MergeSort
  def initialize(array)
    @array = array.clone
  end

  def merge(arr1, arr2)
    result = []
    i, j = 0, 0

    while i <= (arr1.length - 1) || j <= (arr2.length - 1)
      first, second = arr1[i], arr2[j]

      if second.nil? || (!first.nil? && first.to_i <= second.to_i)
        result << first
        i += 1
      elsif first.nil? || second.to_i < first.to_i
        result << second
        j += 1
      end
    end

    result
  end

  def partition(array = @array)
    return array if array.length == 1
    mid_ceil = (array.length / 2.0).ceil
    left = partition(array[0, mid_ceil])
    right = partition(array[mid_ceil, array.length])
    return merge(left, right)
  end

  def sort
    sorted = partition
    result = sorted.map do |element|
      index_of_whitespace = element.index(' ')
      element.slice((index_of_whitespace + 1)..-1)
    end

    result
  end
end

def full_merge_sort(array)
  merge = MergeSort.new(array)
  p merge.sort
end

full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
