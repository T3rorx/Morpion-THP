# frozen_string_literal: true

begin
  require 'colorize'
rescue LoadError
  # Si colorize est indisponible, on crée une version neutre pour éviter les erreurs
  class String
    def colorize(*)
      self
    end
  end
end

# Classe utilitaire dédiée à l'affichage et aux interactions texte
class Show
  # Affiche un écran de bienvenue clair et sympathique
  def self.afficher_bienvenue
    effacer_terminal
    puts '=============================='.colorize(:light_green)
    puts '      Bienvenue au Morpion    '.colorize(:light_green)
    puts '=============================='.colorize(:light_green)
    puts
  end

  # Demande le prénom d'un joueur
  def self.demander_nom(numero)
    print "Merci de saisir le prénom du joueur #{numero} : "
    gets.chomp.strip
  end

  # Affiche le plateau avec un rendu simple
  def self.afficher_plateau(board)
    effacer_terminal
    puts '    1   2   3'
    puts '  -------------'
    board.lignes_pour_affichage.each_with_index do |ligne_symboles, index|
      symboles_colorises = ligne_symboles.map { |symbole| formater_symbole(symbole) }
      etiquette_ligne = %w[A B C][index]
      puts "#{etiquette_ligne} | #{symboles_colorises[0]} | #{symboles_colorises[1]} | #{symboles_colorises[2]} |"
      puts '  -------------'
    end
    puts
  end

  # Affiche un message pour indiquer à qui c'est le tour
  def self.afficher_tour(joueur)
    puts "C'est à #{joueur.nom} de jouer (#{joueur.symbole})."
  end

  # Demande la case où le joueur veut jouer
  def self.demander_case
    print 'Merci d\'indiquer la case souhaitée (ex: A1) : '
    gets.chomp.upcase.strip
  end

  # Signale une erreur de saisie
  def self.afficher_erreur(message)
    puts "\n[Erreur] #{message}\n".colorize(:light_yellow)
  end

  # Affiche le gagnant
  def self.afficher_victoire(joueur)
    puts "Bravo #{joueur.nom}, tu as gagné !".colorize(:light_cyan)
  end

  # Affiche un message de match nul
  def self.afficher_match_nul
    puts 'Match nul ! Le plateau est plein.'.colorize(:light_cyan)
  end

  # Demande si les joueurs veulent refaire une partie
  def self.demander_rejouer?
    print 'Souhaitez-vous rejouer ? (o/n) : '
    reponse = gets.chomp.strip.downcase
    reponse == 'o'
  end

  # Affiche un message de fin de programme
  def self.afficher_a_bientot
    puts '\nMerci d\'avoir joué, à bientôt !'
  end

  # Nettoie l'écran pour une meilleure lisibilité si le terminal le permet
  def self.effacer_terminal
    return unless terminal_disponible?

    system('clear') || system('cls')
  end

  # Vérifie que la session dispose d'un terminal configuré
  def self.terminal_disponible?
    term = ENV['TERM']
    term && !term.empty?
  end

  # Formate un symbole pour l'affichage (couleurs pour X et O)
  def self.formater_symbole(symbole)
    case symbole
    when 'X'
      'X'.colorize(:light_red)
    when 'O'
      'O'.colorize(:light_blue)
    else
      symbole
    end
  end

  private_class_method :effacer_terminal, :terminal_disponible?, :formater_symbole
end
