#Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
#Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
#Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.

require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game
  def initialize
    @board = Board.new
    @display = Show.new(@board)
    @player1 = Player.new("José", "X")
    @player2 = Player.new("John", "O")
    puts " Game initilized "
  end

  def game_logic
    @display.show
    # game_n < 9
    puts "#{@player1.name} Choisi une case"
    choice = gets.chomp
    puts "valeur B1 #{@board.b1.value}"

    # game_n = game_n + 1
    @display.show
  end
end
