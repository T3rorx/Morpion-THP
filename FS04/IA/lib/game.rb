# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'show'

# Classe centrale qui gère une partie complète de morpion
class Game
  attr_reader :board, :joueurs

  def initialize(nom_joueur1, nom_joueur2)
    @joueurs = [
      Player.new(nom_via_defaut(nom_joueur1, 'Joueur 1'), 'X'),
      Player.new(nom_via_defaut(nom_joueur2, 'Joueur 2'), 'O')
    ]
    @board = Board.new
    @index_joueur = 0
  end

  # Lance la boucle de jeu jusqu'à la victoire ou au match nul
  def jouer
    loop do
      Show.afficher_plateau(board)
      joueur = joueur_courant
      Show.afficher_tour(joueur)

      position = demander_case_valide
      board.jouer_case(position, joueur.symbole)

      if board.victoire?(joueur.symbole)
        Show.afficher_plateau(board)
        Show.afficher_victoire(joueur)
        break
      elsif board.plein?
        Show.afficher_plateau(board)
        Show.afficher_match_nul
        break
      else
        changer_joueur
      end
    end
  end

  private

  # Retourne le joueur dont c'est le tour
  def joueur_courant
    joueurs[@index_joueur]
  end

  # Passe au joueur suivant
  def changer_joueur
    @index_joueur = (@index_joueur + 1) % joueurs.length
  end

  # Boucle jusqu'à obtenir une entrée valide pour le plateau
  def demander_case_valide
    boucle = true
    case_choisie = nil

    while boucle
      case_choisie = Show.demander_case
      if !board.case_valide?(case_choisie)
        Show.afficher_erreur('Cette case n\'existe pas.')
      elsif !board.case_libre?(case_choisie)
        Show.afficher_erreur('Cette case est déjà occupée.')
      else
        boucle = false
      end
    end

    case_choisie
  end

  # Si l'utilisateur laisse le nom vide, on met un nom par défaut
  def nom_via_defaut(nom, fallback)
    return fallback if nom.nil? || nom.empty?

    nom
  end
end
