# frozen_string_literal: true

# Vue simple pour afficher / demander des informations
class Show
  # Nettoie l'écran si possible
  def clear_screen
    system('clear') || system('cls')
  end

  # Affiche un en-tête de partie
  def header(game_number)
    puts "MORPION - Partie ##{game_number}"
    puts '-' * 30
  end

  # Affiche le plateau 3x3
  def board(board)
    puts "    1   2   3"
    %w[A B C].each do |row|
      line = [1, 2, 3].map { |c| board.cases["#{row}#{c}"]&.to_s || ' ' }
      puts "#{row}   #{line[0]} | #{line[1]} | #{line[2]}"
      puts "   ---+---+---" unless row == 'C'
    end
    puts
  end

  # Invite un joueur à saisir un coup
  def ask_move(player_name)
    print "#{player_name}, choisis une case (ex: A1, B3) : "
    STDOUT.flush
  end

  # Demande un prénom pour joueur n°numero
  def self.demander_nom(numero)
    print "Prénom du Joueur #{numero} : "
    STDIN.gets.to_s.strip
  end

  # Affiche une erreur lisible
  def self.afficher_erreur(message)
    puts "[Erreur] #{message}"
  end

  # Affiche le résultat final
  def result(status, winner_name: nil)
    case status
    when :x, :o
      puts "Victoire de #{winner_name} !"
    when :draw
      puts 'Match nul !'
    end
  end

  # Demande si on rejoue
  def ask_replay
    print 'Rejouer ? (o/n) : '
    STDOUT.flush
  end
end
