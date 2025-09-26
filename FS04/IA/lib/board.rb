# frozen_string_literal: true

require_relative 'board_case'

# Classe qui représente le plateau complet du morpion
# Elle gère les 9 cases, les coups joués et les vérifications de victoire
class Board
  POSITIONS = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3].freeze
  COMBINAISONS_GAGNANTES = [
    %w[A1 A2 A3],
    %w[B1 B2 B3],
    %w[C1 C2 C3],
    %w[A1 B1 C1],
    %w[A2 B2 C2],
    %w[A3 B3 C3],
    %w[A1 B2 C3],
    %w[A3 B2 C1]
  ].freeze

  attr_reader :cases, :coups_joues

  def initialize
    @cases = creer_cases
    @coups_joues = 0
  end

  # Retourne true si la case demandée existe sur le plateau
  def case_valide?(position)
    cases.key?(position)
  end

  # Retourne true si la case est vide
  def case_libre?(position)
    case_valide?(position) && cases[position].vide?
  end

  # Tente de placer un symbole dans la case choisie
  def jouer_case(position, symbole)
    return false unless case_libre?(position)

    cases[position].remplir(symbole)
    @coups_joues += 1
    true
  end

  # Vérifie si le symbole donné réalise une combinaison gagnante
  def victoire?(symbole)
    COMBINAISONS_GAGNANTES.any? do |combinaison|
      combinaison.all? { |position| cases[position].symbole == symbole }
    end
  end

  # Retourne true si toutes les cases ont été jouées
  def plein?
    coups_joues >= POSITIONS.length
  end

  # Fournit une liste prête à afficher des symboles de chaque case
  def lignes_pour_affichage
    [
      [cases['A1'].symbole, cases['A2'].symbole, cases['A3'].symbole],
      [cases['B1'].symbole, cases['B2'].symbole, cases['B3'].symbole],
      [cases['C1'].symbole, cases['C2'].symbole, cases['C3'].symbole]
    ]
  end

  # Remet toutes les cases à zéro et réinitialise le compteur de coups
  def reinitialiser
    cases.each_value(&:reinitialiser)
    @coups_joues = 0
  end

  private

  # Construit un hash { 'A1' => BoardCase, ... }
  def creer_cases
    POSITIONS.each_with_object({}) do |position, hash|
      hash[position] = BoardCase.new(position)
    end
  end
end
