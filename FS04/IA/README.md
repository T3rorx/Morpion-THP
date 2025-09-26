# Morpion en Ruby

Ce projet propose une implémentation simple du jeu du morpion (tic-tac-toe) en Ruby, entièrement en programmation orientée objet et abondamment commentée en français.

## Lancer le jeu

1. Vérifie que Ruby est installé (`ruby -v`).
2. Installe les dépendances :

```bash
bundle install
```

3. Exécute la commande suivante depuis la racine du projet :

```bash
ruby app.rb
```

Le programme te demandera les prénoms des deux joueurs, affichera le plateau (avec des couleurs grâce à la gem `colorize`) et invitera chaque joueur à choisir une case tour après tour. Quand une partie se termine, tu pourras décider de rejouer immédiatement.

## Structure des classes

- `Application` : gère l'enchaînement des parties et la collecte des prénoms.
- `Game` : coordonne un tour de jeu complet (saisie, validation, victoire, nul).
- `Board` : contient l'état du plateau et détecte victoire ou match nul.
- `BoardCase` : modèle une case individuelle du plateau.
- `Player` : stocke le nom et le symbole de chaque joueur.
- `Show` : centralise tous les affichages et interactions avec l'utilisateur.

## Remarques

- Le code est volontairement direct, avec des méthodes courtes et des commentaires en français pour aider à la compréhension.
- L'unique dépendance externe est `colorize`, utilisée pour rendre l'affichage du plateau plus lisible.
