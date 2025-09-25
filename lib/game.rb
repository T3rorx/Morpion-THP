#Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
#Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
#Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.

require_relative 'game'
require_relative 'player'
require_relative 'boardcase'
require_relative 'show'
require_relative 'board'

class Game
  game_n = 1
  def initialize
    @board1 = Show.new
    @player1 = Player.new("José","X")
    @player2 = Player.new("John","O")
    @a1 = BoardCase.new("A1")
    @a2 = BoardCase.new("A2")
    @a3 = BoardCase.new("A3")
    @b1 = BoardCase.new("B1", "O")
    @b2 = BoardCase.new("B2")
    @b3 = BoardCase.new("B3")
    @c1 = BoardCase.new("C1")
    @c2 = BoardCase.new("C2")
    @c3 = BoardCase.new("C3")
    puts " Game initilized "
  end
  def game_logic
    @board1.show
     #game_n < 9
      puts "#{@player1.name} Choisi une case"
      choice = "gets.chomp"
      puts "valeur B1 #{@b1.value}"


      #game_n = game_n+1
    
    @board1.show
  end
end