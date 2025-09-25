require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/boardcase'
require_relative 'lib/show'
require_relative 'lib/board'

# Application : cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.


DELAY = 1

#player2.Player(victory)
#binding.pry

Game.new.game_logic