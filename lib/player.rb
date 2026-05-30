class Player
  attr_accessor :state, :name
  attr_reader :wins

  WINS = [0b111000000, 0b000111000, 0b000000111, 0b100100100, 0b010010010, 0b001001001, 0b100010001, 0b001010100]
  def initialize(character)
    @state = 0b000000000
    @name = character
  end

  def place(input)
    self.state |= 1 << input
  end

  def check_win
    WINS.any? { |x| x & state == x }
  end
end
