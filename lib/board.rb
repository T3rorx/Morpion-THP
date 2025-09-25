require_relative 'boardcase'

class Board
  attr_reader :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :winner

  def initialize
    @a1 = BoardCase.new("A1")
    @a2 = BoardCase.new("A2")
    @a3 = BoardCase.new("A3")
    @b1 = BoardCase.new("B1")
    @b2 = BoardCase.new("B2")
    @b3 = BoardCase.new("B3")
    @c1 = BoardCase.new("C1")
    @c2 = BoardCase.new("C2")
    @c3 = BoardCase.new("C3")
  end
end