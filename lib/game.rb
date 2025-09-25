
require_relative 'player'
require_relative 'board'
require_relative 'show'
require 'colorize'

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
      play(@player1)
      if winner(@player1)
        @display.show
        break
      else
      end
      game_n = game_n + 1
      puts "Coup #{game_n}"
      @display.show
      play(@player2)
      if winner(@player2)
        @display.show
        break
      else
      end
      game_n = game_n + 1
      puts game_n
      @display.show
    end
  if game_n == 9 
    puts "Match NUL"
  else 
  end
  end
  def play(player)
    loop do
      puts ("#{player.name} Choisi une case").colorize(:color => :red)
      choice = gets.chomp.downcase
      if !@valid.include?(choice)
        puts "Mauvaise saisie"
      elsif @board.send(choice).value != (" ")
        puts "Case deja jouer"
      else
        @board.send(choice).value = player.symbole
        break
      end
    end
  end
    def winner(player)
      if player.symbole == @board.a1.value && player.symbole == @board.b2.value && player.symbole == @board.c3.value
        win(player)
        return true
      elsif player.symbole == @board.a3.value && player.symbole == @board.b2.value && player.symbole == @board.c1.value
        win(player)
        return true
      elsif player.symbole == @board.a1.value && player.symbole == @board.a2.value && player.symbole == @board.a3.value
        win(player)
        return true
      elsif player.symbole == @board.b1.value && player.symbole == @board.b2.value && player.symbole == @board.b3.value
        win(player)
        return true
      elsif player.symbole == @board.c1.value && player.symbole == @board.c2.value && player.symbole == @board.c3.value
        win(player)
        return true
      elsif player.symbole == @board.a1.value && player.symbole == @board.b1.value && player.symbole == @board.c1.value
        win(player)
        return true
      elsif player.symbole == @board.a2.value && player.symbole == @board.b2.value && player.symbole == @board.c2.value
        win(player)
        return true
      elsif player.symbole == @board.a3.value && player.symbole == @board.b3.value && player.symbole == @board.c3.value
        win(player)
        return true
      else
    end
  end
  def win(player)
    puts "Bravo #{player.name} T'es un GOAT"
  end
end
