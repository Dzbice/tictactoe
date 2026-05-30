require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player_one = Player.new('X')
    @player_two = Player.new('O')
  end

  def mainloop
    turn_count = 0
    loop do
      if turn_count >= 9

        puts 'Draw!'
        puts @board
        break
      end
      turn(@player_one)
      turn_count += 1
      if @player_one.check_win
        puts "#{@player_one.name} wins!"
        puts @board
        break
      end
      puts @board
      turn(@player_two)
      turn_count += 1
      if @player_two.check_win
        puts "#{@player_two.name} wins!"
        puts @board
        break
      end
      puts @board
    end
  end

  def turn(player)
    loop do
      puts 'please enter a number 1-9 for location'
      input = gets.chomp
      unless input_validation_int?(input)
        puts 'please enter a valid input'
        next
      end
      unless @board.board[input.to_i - 1].nil?
        puts 'please enter a valid location'
        next
      end
      @board.place(input.to_i - 1, player.name)
      player.place(input.to_i - 1)
      break
    end
  end

  def input_validation_int?(input)
    return false if !Numeric?(input) || input.to_i < 1 || input.to_i > 9

    true
  end

  def Numeric?(str)
    true if Integer(str)
  rescue StandardError
    false
  end
end
