class SubArrays
  attr_reader :subarrays

  def initialize(arr)
    @arr = arr.clone
    @size = @arr.size
    @subarrays = []
    all_subarrays
  end

  def all_subarrays(index = 0, subarray = [])
    if index == @size
      @subarrays << subarray
    else
      all_subarrays(index + 1, subarray)
      all_subarrays(index + 1, subarray + [@arr[index]])
    end
  end

end

numbers = [1, 2, 3]

subs = SubArrays.new numbers
subs.subarrays