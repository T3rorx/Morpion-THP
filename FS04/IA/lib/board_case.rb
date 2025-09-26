# frozen_string_literal: true

# Classe qui représente une case individuelle du plateau de morpion
# Chaque case connaît sa position (ex: "A1") et le symbole qu'elle contient
class BoardCase
  attr_reader :position, :symbole

  # On initialise chaque case vide (symbole = " ")
  def initialize(position)
    @position = position
    @symbole = ' '
  end

  # Retourne true si la case est vide
  def vide?
    symbole == ' '
  end

  # Place le symbole du joueur dans la case si elle est encore libre
  def remplir(nouveau_symbole)
    return false unless vide?

    @symbole = nouveau_symbole
    true
  end

  # Remet la case à l'état vide pour une nouvelle partie
  def reinitialiser
    @symbole = ' '
  end
end
