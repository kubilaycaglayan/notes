class Meeting
  attr_reader :event
  @@EVENTS = {}
  @@OVERLAPS = {}
  def initialize(event)
    add_event event
  end

  def add_event(event)
    @event = event
    @@EVENTS[@@EVENTS.length] = event
    check_overlap event
  end

  def add_overlap(index)
    @overlapping_events.push(index)
  end

  def ranger(num1, num2)
    range = []
    while num1 != num2
      range << num1
      num1 = (num1 + 1) % 24
    end
    range
  end

  def overlap?(event1, event2)
    first = ranger(event1.first, event1.last)
    second = ranger(event2.first, event2.last)
    result = first.any? do |hour|
      second.include? hour
    end

    result
  end

  def check_overlap(event1)
    @@EVENTS.each do |id, event2|
      @@OVERLAPS[id] = 0 if @@OVERLAPS[id].nil?
      @@OVERLAPS[id] += 1 if overlap?(event1, event2)
    end
  end

  def overlaps
    @overlapping_events.count
  end

  class << self
    def events
      @@EVENTS
    end

    def overlaps
      @@OVERLAPS
    end

    def optimize
      kick = overlaps.values.index(overlaps.values.max)
      @@EVENTS.delete(kick)
      @@OVERLAPS.delete(kick)
      p overlaps.values
      @@EVENTS.values
    end

    def clear
      @@EVENTS = {}
      @@OVERLAPS = {}
    end
  end
end

class Organizer
  attr_reader :meeting_hash
  def initialize(array)
    @meeting_hash = hash_it(array)
  end

  def hash_it(array)
    event_objects = {}
    index = 0
    Meeting.clear
    array.each_slice(2) do |event|
      event_objects[index] = Meeting.new(event)
      index += 1
    end
    event_objects
  end

  def filter
    p Meeting.overlaps
    Meeting.optimize
  end
end

def time_scheduler(array)
  meetings = Organizer.new(array)
  meetings.filter
end

=begin ,
p time_scheduler([1, 3, 4, 8, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]
=end

puts
p time_scheduler([3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14])
# => [[1, 2], [4, 5], [8, 14]]

=begin
puts
p time_scheduler([0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5])
# => [[0, 1], [14, 16], [10, 12], [7, 9], [8, 15], [3, 5]]
puts
p time_scheduler([2, 6, 5, 10, 7, 12, 0, 9, 4, 8])
# => [[2, 6], [7, 12]]
=end