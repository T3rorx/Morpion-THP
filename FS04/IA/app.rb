
# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/show'

boucle = true

def saisir_nom(numero)
  nom = ''
  while nom.empty?
    nom = Show.demander_nom(numero)
    Show.afficher_erreur('Merci de saisir au moins un caractère.') if nom.empty?
  end
  nom
end


while boucle
  Show.afficher_bienvenue
  nom1 = saisir_nom(1)
  nom2 = saisir_nom(2)

  partie = Game.new(nom1, nom2)
  partie.jouer

  boucle = Show.demander_rejouer?
end

Show.afficher_a_bientot

# Demande un nom et relance tant que l'utilisateur ne saisit rien du tout

