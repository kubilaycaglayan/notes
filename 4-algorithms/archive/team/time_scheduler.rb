class Schedule
  def initialize(array)
    @array = array.clone
    @meetings = []
    parse @array
    sort_ending
  end

  def non_overlapping_events
    result = [@meetings[0]]

    @meetings.each_with_index do |meeting, index|
      next if index == 0

      last_finishing_hour = result.last[1]

      result << meeting if meeting[0] > last_finishing_hour
    end
    result
  end


  private

  def sort_ending
    @meetings.sort! do |first, second|
      first[1] <=> second[1]
    end
  end

  def parse(array)
    array.each_slice(2) do |meeting|
      @meetings << meeting
    end
  end
end

def time_scheduler(array)
  new_instance_of_the_schedule_class = Schedule.new(array)
  new_instance_of_the_schedule_class.non_overlapping_events
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]