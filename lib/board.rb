class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9)
  end

  def place(location, player)
    @board[location] = player
  end

  # TODO: fix printing to make look good
  def to_s
    (0..2).each do |x|
      print "#{@board[x * 3]} | #{@board[x * 3 + 1]} | #{@board[x * 3 + 2]} \n"
      puts '-----'
    end
  end
end
