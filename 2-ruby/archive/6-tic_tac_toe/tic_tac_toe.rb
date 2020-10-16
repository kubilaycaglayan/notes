def questioning(question, _answer)
  puts question
  # answer = answer
  answer = gets.chomp!
end

board = {
  first: 0, second: 0, third: 0,
  fourth: 0, fifth: 0, sixth: 0,
  seventh: 0, eigth: 0, ninth: 0
}
def show(hash)
  keys = hash.keys
  puts '_______'
  3.times do |row|
    print ' '
    3.times do |column|
      item =
        case hash[keys[(row * 3) + column]]
        when 1
          'X'
        when 10
          'O'
        else
          '.'
        end
      print item, ' '
    end
    puts
  end
  puts '_______'
end

def sum_lines(hash)
  hash.each_value.map(&:to_i)
  linear1 = hash[:first] + hash[:second] + hash[:third]
  linear2 = hash[:fourth] + hash[:fifth] + hash[:sixth]
  linear3 = hash[:seventh] + hash[:eigth] + hash[:ninth]
  linear4 = hash[:first] + hash[:fourth] + hash[:seventh]
  linear5 = hash[:second] + hash[:fifth] + hash[:eigth]
  linear6 = hash[:third] + hash[:sixth] + hash[:ninth]
  diagonal1 = hash[:first] + hash[:fifth] + hash[:ninth]
  diagonal2 = hash[:seventh] + hash[:fifth] + hash[:third]
  result = [linear1, linear2, linear3, linear4, linear5, linear6, diagonal1, diagonal2]
  result
end

def game_over?(board)
  if sum_lines(board).max == 30
    return true
  elsif sum_lines(board).include?(3)
    return true
  end

  false
end

# input X
# change
# show
# input O
game_over = false
turn = 1
show(board)
until game_over
  keys = board.keys
  move = questioning("What's your move#{turn.odd? ? ' X' : ' O'}?(1-9)", 5).to_i
  turn.odd? ? (board[keys[move - 1]] = 1) : (board[keys[move - 1]] = 10)
  show(board)
  turn += 1
  game_over = true if game_over?(board)
end
