
require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game
    def initialize
    @board = Board.new
    @display = Show.new(@board)
    @player1 = Player.new("José", "X")
    @player2 = Player.new("John", "O")
    @valid = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]
    puts " Game initilized "
  end

  def game_logic
    @display.show
    choice = " "
    game_n = 1
    while game_n <= 9
      player1_play
      game_n = game_n + 1
      @display.show
      player2_play
      game_n = game_n + 1
      @display.show
    end
  if game_n == 9 
    puts "Match NUL"
  else 
    puts "Ca marche pas"
  end
  end
  def player1_play
    loop do
      puts "#{@player1.name} Choisi une case"
      choice = gets.chomp.downcase
      if !@valid.include?(choice)
        puts "Mauvaise saisie"
      elsif @board.send(choice).value != (" ")
        puts "Case Non Disponnible"
      else
        @board.send(choice).value = @player1.symbole
        break
      end
    end
  end
  def player2_play
    loop do
      puts "#{@player2.name} Choisi une case"
      choice = gets.chomp.downcase
      if !@valid.include?(choice)
        puts "Mauvaise saisie"
      elsif @board.send(choice).value != (" ")
        puts "Case Non Disponnible"
      else
        @board.send(choice).value = @player2.symbole
        break
      end
    end
  end
end
