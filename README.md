# Jeu 2️⃣0️⃣4️⃣8️⃣

| ![Alaaeddin ALMAJJO](https://avatars.githubusercontent.com/u/77294802?v=4) | ![Pape THIAM](https://avatars.githubusercontent.com/u/97792012?v=4) |
| :------------------------------------------------------------------------: | :-----------------------------------------------------------------: |
|                             Alaaeddin ALMAJJO                              |                             Pape THIAM                              |
|                                  22001993                                  |                              22009010                               |
|                  [@aladinMJ](https://github.com/aladinMJ)                  |               [@mayel15](https://github.com/mayel15)                |
|                         alaaeddin.almajjo@uphf.fr                          |                    papemayeldiagne.thiam@uphf.fr                    |

# 📱 Demo du jeu

![alt text](readme-images/game2048-demo.gif)

# 🧰 Technos utilisées

<a href="https://angular.io" target="_blank" rel="noreferrer"> <img src="./readme-images/dart.svg" alt="angular" width="100" height="100"/> </a> <a href="https://angular.io" target="_blank" rel="noreferrer"> <img src="./readme-images/flutter.svg" alt="angular" width="100" height="100"/> </a>

# ➕ More

- provider

# 🧐 Description du projet et choix d'implémentation

## 📄 Description du projet

Ce projet est une implémentation du célébre `jeu 2048`.

- Pour en savoir plus sur els règles et comment fonctionne le jeu: [gam2048](<https://fr.wikipedia.org/wiki/2048_(jeu_vid%C3%A9o)>)
- Pour prendre en main facilement le jeu et y jouer

## ⚙️ Choix d'implémentation

Le code source du projet se trouve dans le dossier `lib` qui contient le dossier `src` et le fichier `main.dart`. Le dossier `src` est structuré comme suit :

```
├── enums
├── models
├── pages
└── widgets
```

- `enums` contient les fichiers:

  - `direction.enum.dart` qui definit le type enum `Direction`avec les champs `horizontal`et `vertical`, afin de savoir dans quelle direction se fera le mouvement de la grille de jeu
  - `swipe-type.enum.dart` qui définit le type enum `SwipeType` afin de preciser le sens du swipe lors du jeu avec les champs `left`, `right`, `up`, `down`

- `models` contient le fichier:

  - `game.model.dart` avec `GameModel` qui permet de définir les structure données et toutes les algorithmes nécessaire pour vérifier les règles du jeu, jouer, mettre à jour le score vérifier si c'est gagné ou si c'est perdu

- `pages` contient les fichiers consommant directement ou indirectement des données de `GameModel` à travers `provider` :

  - `home.page.dart` qui représente l'écran principal du jeu
  - `game-won.page.dart` qui représente l'écran qui va s'afficher lorsque le jeu est gagné
  - `game-over.page.dart` qui représente l'écran qui va s'afficher lorsque le jeu est perdu

- `widgets` contients des composants/widegets personnalisés qui sont paramétrables et utilisatbles partout dans le projets. Et c'est eux qui définissent les pages du jeu. Parmi les widgets, on a:
  - `swipe-detector.widget.dart` qui prend en paramètres 4 types de callback selon le sens du swipe (haut, bas, gauche, droite)
  - `grid.widget.dart` qui prend en paramètre une liste de liste d'entier et retourne en rendu une grille de 2 dimenensions 4x4
  - `score.widget.dart` avec `ScoreWidget`qui prend en paramètres le `score` et le `label` indiquant le type de score
  - `current-score.widget.dart` avec `CurrentScoreWidget`qui va utiliser le widget `ScoreWidget` en consommant le model `GameModel` à travers provider afin d'updater le `current score`
  - `custom-button.widget.dart` avec `CustomButtonWidget` et `custom-text.widget.dart` avec `CustomTextWidget` qui sont des cusomisations des widgets `Button` et `Text` qui existent déjà.

# Cloner le projet

- Pré-requis: Vous devez avoir le `SDK flutter` installés sur votre ordinateur avec les versions suivante de préférences :

  - `Flutter v3.24.1`
  - `Dart v3.5.1`

- Cloner le projet avec `git clone `

- Installer les dépendances avec `flutter packages get`
