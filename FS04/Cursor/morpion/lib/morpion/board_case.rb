# frozen_string_literal: true

# Représente une case du plateau (ex: "A1", "B2")
# - key: identifiant de la case
# - value: contenu (nil, "X" ou "O")
class BoardCase
  attr_reader :key
  attr_accessor :value

  def initialize(key)
    @key = key
    @value = nil
  end

  # La case est-elle vide ?
  def empty?
    value.nil?
  end

  # Pour l'affichage : renvoie un espace si la case est vide
  def to_s
    value.nil? ? " " : value
  end
end
