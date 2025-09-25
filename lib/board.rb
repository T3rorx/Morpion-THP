#Board : à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).
#Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. Il faut les lui attribuer sous forme d'un array ou d'un hash. Aussi, il est utile de compter le nombre de coup joué pour identifier facilement si on arrive au 9ème coup sans vainqueur.
#Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).

require_relative 'game'
require_relative 'player'
require_relative 'boardcase'
require_relative 'show'
require_relative 'board'


class Board
  attr_accessor :board
  @@all_boardcase = []
  def initialize
    @board = board
  end
    def self.all
    @@all_boardcase
  end
end