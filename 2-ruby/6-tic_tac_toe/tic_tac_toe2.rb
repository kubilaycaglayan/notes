class Game
  def initialize
    @board = create_board
    @keys = @board.keys
  end
  def play
    greeting
    9.times do |turn|
      show_board
      move = question(turn)
      next if check_spot(move, turn) == "jump_next"
      break if check_game == true
    end
    end_message
  end
  private
  def create_board
    board = Hash.new
    9.times do |i|
      board[(:aaa..:aai).to_a.map(&:to_sym)[i]] = 0
    end
    board
  end
  def question(turn)
    turn = turn.even? ? "X" : "O"
    text = "Make your move #{turn} (1..9):"
    text.size.times do |i|
      print text[i]
      sleep 0.01
    end
    puts
    loop do
      answer = gets.chomp!.to_i
      if ((1..9).include? answer)
        return answer
      else
        puts "Please enter a number between 1 and 9..."
      end
    end
  end
  def check_spot(move, turn)
    unless @board[@keys[move - 1]] == 0
      text = "Please make another move. That (#{move}) place is already taken!"
      text.size.times do |i|
        print text[i]
        sleep 0.03
      end
      puts
      show_board_hint
      return "jump_next"
    else
      make_move(move, turn)
    end
  end
  def calculate_board
    sum_of_lines = []
    3.times do |i|
      sum_line = @board[@keys[i * 3]] + @board[@keys[i * 3 + 1]] + @board[@keys[i * 3 + 2]]
      sum_of_lines << sum_line
      sum_line = @board[@keys[i]] + @board[@keys[i + 3]] + @board[@keys[i + 6]]
      sum_of_lines << sum_line
    end
    2.times do |i|
      sum_diagonal = @board[@keys[i + i]] + @board[@keys[4]] + @board[@keys[8 - i * 2]]
      sum_of_lines << sum_diagonal
    end
    sum_of_lines
  end
  def make_move(move, turn)
    mark = turn.even? ? 1 : 10
    @board[@keys[move - 1]] = mark
  end
  def show_board
    board = @board.each_value.to_a
    board.map! do |item|
      case item
      when 0
        ' . '
      when 1
        " X "
      when 10
        " O "
      end
    end
    puts
    puts "  -------------------"
    3.times do |i|
      print "  | ", board[i * 3], " | ", board[i * 3 + 1], " | ", board[i * 3 + 2], " |\n  #{"-------------------\n" if i < 2}"  
    end
    puts "-------------------"
  end
  def show_board_hint
    board = @board.each_value.to_a
    board.map! do |item|
      case item
      when 0
        "(#{board.index(item) + 1})"
      when 1
        " X "
      when 10
        " O "
      end
    end
    puts
    puts "  -------------------"
    3.times do |i|
      print "  | ", board[i * 3], " | ", board[i * 3 + 1], " | ", board[i * 3 + 2], " |\n  #{"-------------------\n" if i < 2}"  
    end
    puts "-------------------"
  end  
  def check_game
    calculate_board.each do |item|
      if item == 30 || item == 3
        return true
      end
    end
    unless @board.each_value.to_a.include? 0
      return true
    end
  end
  def end_message
    puts "game over".upcase
    show_board
    if calculate_board.include?(3)
      puts "X win!".upcase
    elsif calculate_board.max == 30
      puts "Y win!".upcase
    else
      puts "That's a draw!".upcase
    end
  end
  def greeting
    show_board_hint
    puts "Welcome to TIC TAC TOE game..."
  end
end

new_game = Game.new
new_game.play
