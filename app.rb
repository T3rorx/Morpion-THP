require 'bundler'
require 'pry'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/boardcase'
require_relative 'lib/show'
require_relative 'lib/board'

# Application : cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.

player1 = Player.new("José","X")
player2 = Player.new("John","O")
board1 = Show.new

DELAY = 1

puts "#{player1.name} | #{player1.symbole} | #{player1.victory}"
puts "#{player2.name} | #{player2.symbole} | #{player2.victory}"
#player2.Player(victory)

board1.show


#binding.pry

#Game.new.run!