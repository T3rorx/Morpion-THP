#Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.
require_relative 'board'

class Show < Board
  def show
    puts "   1   2   3 "
    puts "A  #{@a1.value} | #{@a2.value} | #{@a3.value} "
    puts "  -----------"
    puts "B  #{@b1.value} | #{@b2.value} | #{@b3.value} "
    puts "  -----------"
    puts "C  #{@c1.value} | #{@c2.value} | #{@c3.value} "
  end
  def test
    puts "test 1"
  end
end