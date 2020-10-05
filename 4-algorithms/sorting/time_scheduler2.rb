class Meeting
  def initialize(array)
    @raw = array.clone
    @meetings = []
    @filtered = []
    group
    sort_by_ending
  end

  def filter
    @filtered << @meetings[0]

    @meetings.each_with_index do |meeting,index|
      last = @filtered.last[1]
      @filtered << meeting if meeting[0] > last
    end
  end

  def result
    @filtered
  end

  private

  def sort_by_ending
    @meetings.sort! do |first, second|
      first[1] <=> second[1]
    end
  end

  def group
    @raw.each_slice(2) do |event|
      @meetings << event
    end
  end
end

def time_scheduler(array)
  meetings = Meeting.new(array)
  meetings.filter
  meetings.result
end

p time_scheduler([1, 3, 4, 8, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]


puts
p time_scheduler([3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14])
# => [[1, 2], [4, 5], [8, 14]]


puts
p time_scheduler([0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5])
# => [[0, 1], [14, 16], [10, 12], [7, 9], [8, 15], [3, 5]]


puts
p time_scheduler([2, 6, 5, 10, 7, 12, 0, 9, 4, 8])
# => [[2, 6], [7, 12]]

puts
p time_scheduler([1, 20, 21, 23,
                  1, 21,  6,  8, 9, 12, 13, 15])
