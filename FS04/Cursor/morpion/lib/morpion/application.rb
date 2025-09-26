# frozen_string_literal: true

# Démarre et enchaîne les parties
class Application
  def initialize
    @show = Show.new
    @game_number = 1
  end

  # Lance la boucle principale
  def run!
    loop do
      @show.clear_screen
      @show.header(@game_number)
      p1 = saisir_nom(1)
      p2 = saisir_nom(2)

      game = Game.new(player1_name: p1, player2_name: p2)
      play_game_loop(game)

      break unless replay?
      @game_number += 1
    end

    puts "Merci d'avoir joué !"
  end

  private

  # Demande un prénom non vide
  def saisir_nom(numero)
    nom = ''
    while nom.empty?
      nom = Show.demander_nom(numero)
      Show.afficher_erreur('Merci de saisir au moins un caractère.') if nom.empty?
    end
    nom
  end

  # Boucle d'une partie
  def play_game_loop(game)
    loop do
      @show.clear_screen
      @show.header(@game_number)
      @show.board(game.board)

      break if handle_end_if_any(game)

      @show.ask_move(game.current_player.name)
      key = STDIN.gets
      return unless key

      case game.play_turn(key)
      when :invalid then Show.afficher_erreur('Case inexistante : choisis parmi A1..C3')
      when :occupied then Show.afficher_erreur('Case déjà prise : rejoue')
      when :ok
        # coup accepté
      end
    end
  end

  # Si fin atteinte, affiche le résultat et stoppe la boucle
  def handle_end_if_any(game)
    case game.status
    when :x, :o, :draw
      @show.board(game.board)
      @show.result(game.status, winner_name: game.winner_name)
      true
    else
      false
    end
  end

  # Demande si on rejoue
  def replay?
    loop do
      @show.ask_replay
      ans = STDIN.gets.to_s.strip.downcase
      return true if %w[o oui y].include?(ans)
      return false if %w[n non no].include?(ans)
    end
  end
end
