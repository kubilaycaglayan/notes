#!/usr/bin/env ruby

module Visualizer
  def slow_typing(text, speed)
    text.size.times do |i|
      print text[i]
      sleep speed * 0.01
    end
    puts
  end
  BOARD_CYPHER = { "0": ' . ', "1": ' X ', '10': ' O ' }.freeze
  def show_board(board)
    board_show = board.clone
    board_show.map! do |item|
      BOARD_CYPHER[item.to_s.to_sym]
    end
    draw_grid(board_show)
  end

  def show_board_hint(board)
    hint_board = board.clone
    hint_board.map! do |item|
      if item.zero?
        "(#{hint_board.index(item) + 1})"
      else
        BOARD_CYPHER[item.to_s.to_sym]
      end
    end
    draw_grid(hint_board)
  end

  def draw_grid(array)
    hypens = '-------------------'
    hypens_w_nl = "-------------------\n"
    puts "\n  " + hypens
    3.times do |i|
      print '  | ', array[i * 3], ' | ', array[i * 3 + 1], ' | ', array[i * 3 + 2], " |\n  #{hypens_w_nl if i < 2}"
    end
    puts hypens
  end
end

module QuestionMaker
  def question(turn)
    turn = turn.even? ? 'X' : 'O'
    text = "Make your move #{turn} (1..9):"
    slow_typing(text, 1)
    loop do
      answer = gets.chomp!.to_i
      return answer if (1..9).include? answer

      puts 'Please enter a number between 1 and 9...'
    end
  end
end

class Game
  include QuestionMaker
  include Visualizer
  def initialize
    @board = create_board
  end

  def play
    greeting
    9.times do |turn|
      show_board(@board)
      move = question(turn)
      redo if check_spot(move, turn) == 'jump_next'
      break if check_game == true
    end
    end_message
  end

  def auto_play(scenario)
    greeting
    9.times do |turn|
      show_board(@board)
      puts move = scenario[turn]
      sleep 0.5
      redo if check_spot(move, turn) == 'jump_next'
      break if check_game == true
    end
    end_message
  end

  private

  def greeting
    show_board_hint(@board)
    puts "Welcome to #{@name} game..."
  end

  def create_board
    Array.new(9, 0)
  end
end

class TicTacToe < Game
  def initialize
    super
    @name = 'Tic Tac Toe'
  end

  def to_s
    'This is a TIC TAC TOE game!'
  end

  private

  def check_spot(move, turn)
    if @board[move - 1].zero?
      make_move(move, turn)
    else
      text = "Please make another move. That (#{move}) place is already taken!"
      slow_typing(text, 0.5)
      show_board_hint(@board)
      'jump_next'
    end
  end

  def calculate_board
    sum_of_lines = []
    sum_of_lines = calculate_linear(sum_of_lines)
    calculte_diagonal(sum_of_lines)
  end

  def calculate_linear(array)
    3.times do |i|
      sum_line = @board[i * 3] + @board[i * 3 + 1] + @board[i * 3 + 2]
      array << sum_line
      sum_line = @board[i] + @board[i + 3] + @board[i + 6]
      array << sum_line
    end
    array
  end

  def calculte_diagonal(array)
    2.times do |i|
      sum_diagonal = @board[i + i] + @board[4] + @board[8 - i * 2]
      array << sum_diagonal
    end
    array
  end

  def make_move(move, turn)
    mark = turn.even? ? 1 : 10
    @board[move - 1] = mark
  end

  def check_game
    return true if calculate_board.include?(30)
    return true if calculate_board.include?(3)
    return true unless @board.include?(0)
  end

  def end_message
    puts '______________________'
    puts 'game over'.upcase
    show_board(@board)
    puts win_message
    puts '______________________'
  end

  def win_message
    return 'X WIN!' if calculate_board.include?(3)
    return 'O WIN!' if calculate_board.max == 30

    "That's a draw!".upcase
  end
end

new_game = TicTacToe.new
# new_game.auto_play([1,3,2,4,6,5,8,9,7])
new_game.play
