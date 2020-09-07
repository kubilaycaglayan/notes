class Meeting
  def initialize(array)
    @raw = array.clone
    @meetings = []
    @filtered = []
    group
    sort_by_starting
    p @meetings
  end

  def filter
    current = [@meetings[0]]
    @meetings.each_with_index do |meeting, index|
      next if index == 0
      puts "                  ON : #{meeting}"

      last = current.last[1]

      if meeting[0] <= last
        puts "    current: #{current}"
        current << [meeting[0], last >= meeting[1] ? last : meeting[1]]
      else
        @filtered << [current.first[0], last]
        current = [meeting]
      end
    end

    unless current.empty?
      @filtered << [current.first[0], current.last[1]]
    end
  end

  def result
    if @filtered.size == 1
      @filtered.flatten
    else
      @filtered
    end
  end

  class << self
  end

  private

  def sort_by_starting
    @meetings.sort! do |first, second|
      first[0] <=> second[0]
    end
  end

  def group
    @raw.each_slice(2) do |event|
      @meetings << event
    end
  end
end

def maximum_time_range(array)
  meetings = Meeting.new(array)
  meetings.filter
  meetings.result
end

=begin
p maximum_time_range([10, 18, 4, 6, 14, 16, 5, 8])
# => [[4, 8], [10, 18]]
=end

p maximum_time_range([11, 12, 4, 7,
                      14, 16, 0, 2,
                      13, 15, 8, 10])
# => [[0, 2], [4, 7], [8, 10], [11, 12], [13, 16]]