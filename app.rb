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

A1 = BoardCase.new("A1","0")
A2 = BoardCase.new("A2"," ")
A3 = BoardCase.new("A3"," ")
B1 = BoardCase.new("B1"," ")
B2 = BoardCase.new("B2"," ")
B3 = BoardCase.new("B3"," ")
C1 = BoardCase.new("C1"," ")
C2 = BoardCase.new("C2"," ")
C3 = BoardCase.new("C3"," ")
DELAY = 1

puts "#{player1.name} | #{player1.symbole} | #{player1.victory}"
puts "#{player2.name} | #{player2.symbole} | #{player2.victory}"
#player2.Player(victory)

puts A1.value

plateau = Show.new
plateau.show


#binding.pry

#Game.new.run!