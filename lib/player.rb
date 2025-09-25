
# Player
# Variables d'instance : un joueur a un nom (habile) et un symbole ("x" ou "o").

class Player
  attr_accessor :name, :symbole
  @@all_player = []
  def initialize(name, symbole)
    @name = name
    @symbole = symbole
    @@all_players << self
  end
  def self.all
    @@all_player
  end
end
