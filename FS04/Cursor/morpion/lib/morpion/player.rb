# frozen_string_literal: true

# Représente un joueur humain
# - name: prénom du joueur (String)
# - symbol: symbole utilisé sur le plateau ("X" ou "O")
class Player
  attr_reader :name, :symbol

  def initialize(name:, symbol:)
    # On s'assure de retirer les espaces superflus
    @name = name.to_s.strip
    @symbol = symbol
  end
end
