
# Player
# Variables d'instance : un joueur a un nom (habile) et un symbole ("x" ou "o").
require_relative 'game'
require_relative 'player'
require_relative 'boardcase'
require_relative 'show'
require_relative 'board'

class Player
  attr_accessor :name, :symbole, :victory
  @@all_player = []
  def initialize(name, symbole, victory = 0)
    @name = name
    @symbole = symbole
    @victory = victory 
    @@all_player << self
  end
  def self.all
    @@all_player
  end
end
