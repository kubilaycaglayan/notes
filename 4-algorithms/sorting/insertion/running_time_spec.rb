def running_time(array)
  count_move = 0
  for i in 1...array.size
    current = array[i]
    j = i - 1
    while j >= 0 && current < array[j]
      array[j + 1] = array[j]
      j -= 1
      count_move += 1
    end
    array[j + 1] = current
  end
  count_move
end

system 'clear'

describe 'running_time' do
  it 'counts the numbers of moves' do
    expect(running_time([2, 1, 3, 1, 2])).to be 4
  end
end