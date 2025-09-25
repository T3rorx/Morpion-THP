#BoardCase : chacune des 9 instances de BoardCase correspond à l'état d'une case du plateau.
#Variables d'instance : une Boardcase est définie par sa position (A1, B2, B3, etc.) et son contenu (Soit elle est vide, soit elle a comme valeur le string "x", soit elle a comme valeur le string "o").

require_relative 'game'

class BoardCase
  attr_accessor :position, :value
  @@all_boardcase = []
def initialize(position, value = " ")
  @position = position
  @value = value
  @@all_boardcase << self
  end
  def self.all
    @@all_boardcase
  end
end