def time_scheduler(array)
  possible_dates = []

  for i in (0...array.size).step(2)
    possible_dates << [array[i], array[i + 1]]
  end

  possible_dates.sort_by! { |d| d.last }

  dates = [possible_dates.first]
  possible_dates.each_with_index do |date, index|
    if date.first >= dates.last.last
      dates << date
    end
  end

  dates
end

system 'clear'

describe 'time_scheduler' do
  it 'returns the dates with the largest possible meeting numbers' do
    expect(time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])).to match [[1,3], [5,6], [7,9]]
  end
end
