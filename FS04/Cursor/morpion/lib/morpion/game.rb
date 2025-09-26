# frozen_string_literal: true

# Gère une partie: joueurs, plateau, tours et fin
class Game
  attr_reader :board, :players, :current_index

  def initialize(player1_name:, player2_name:)
    @players = [
      Player.new(name: player1_name, symbol: 'X'),
      Player.new(name: player2_name, symbol: 'O')
    ]
    @board = Board.new
    @current_index = 0
  end

  # Joueur dont c'est le tour
  def current_player
    @players[@current_index]
  end

  # Joue un tour avec une saisie utilisateur brute
  # Renvoie : :invalid, :occupied, :ok
  def play_turn(raw_key)
    key = normalize_key(raw_key)
    return :invalid unless @board.cases.key?(key)
    return :occupied unless @board.cases[key].empty?

    @board.play_at(key, current_player.symbol)
    swap_player!
    :ok
  end

  # Statut actuel (délégué au board)
  def status
    @board.status
  end

  # Nom du gagnant si existant
  def winner_name
    case @board.status
    when :x then @players.find { |p| p.symbol == 'X' }.name
    when :o then @players.find { |p| p.symbol == 'O' }.name
    else nil
    end
  end

  # Réinitialise la partie
  def reset!
    @board.reset!
    @current_index = 0
  end

  private

  def swap_player!
    @current_index = 1 - @current_index
  end

  # Normalise la saisie utilisateur: a1 => A1
  def normalize_key(key)
    key.to_s.strip.upcase
  end
end
