#Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.
require_relative 'board'

class Show
  def initialize(board)
    @board = board
  end

  def show
    puts "   1   2   3 "
    puts "A  #{@board.a1.value} | #{@board.a2.value} | #{@board.a3.value} "
    puts "  -----------"
    puts "B  #{@board.b1.value} | #{@board.b2.value} | #{@board.b3.value} "
    puts "  -----------"
    puts "C  #{@board.c1.value} | #{@board.c2.value} | #{@board.c3.value} "
  end
end
