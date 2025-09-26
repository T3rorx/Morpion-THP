# frozen_string_literal: true

# Classe qui représente un joueur humain
# Elle conserve simplement son nom et son symbole (X ou O)
class Player
  attr_reader :nom, :symbole

  def initialize(nom, symbole)
    @nom = nom
    @symbole = symbole
  end
end
