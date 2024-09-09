# To-Do List App

Une application Flutter simple pour gérer des tâches avec une interface utilisateur interactive.

## Description

Cette application permet aux utilisateurs de créer, marquer comme terminé et supprimer des tâches. Elle utilise les fonctionnalités de Flutter pour créer une liste déroulante dynamique avec des options pour gérer les tâches.

## Fonctionnalités

- Ajouter de nouvelles tâches.
- Marquer les tâches comme terminées avec une case à cocher.
- Supprimer des tâches en les faisant glisser vers la gauche.
- Afficher une notification (SnackBar) lors de la suppression d'une tâche.

## Prérequis

- Flutter installé sur votre machine. [Guide d'installation de Flutter](https://flutter.dev/docs/get-started/install)
- Un éditeur de code compatible avec Flutter (comme VS Code ou Android Studio).

## Installation

1. Clonez le dépôt :

    ```sh
    git clone https://github.com/votre-utilisateur/votre-repository.git
    ```

2. Accédez au répertoire du projet :

    ```sh
    cd votre-repository
    ```

3. Installez les dépendances :

    ```sh
    flutter pub get
    ```

## Exécution de l'application

1. Connectez un appareil ou lancez un émulateur.

2. Exécutez l'application :

    ```sh
    flutter run
    ```

## Structure du Code

- **`main.dart`** : Le point d'entrée de l'application. Configure le thème et l'écran d'accueil.
- **`MyApp`** : Le widget racine qui configure le thème et la page d'accueil.
- **`MyWidget`** : Un widget d'état qui gère l'affichage des tâches et les interactions utilisateur.
- **`Task`** : Une classe simple pour représenter une tâche avec un nom et un état terminé.

## Utilisation

1. **Ajouter une tâche** : Entrez le nom de la tâche dans le champ de texte et appuyez sur le bouton "ajouter" ou appuyez sur "Entrée".
2. **Marquer comme terminé** : Cochez la case à côté de la tâche pour marquer la tâche comme terminée.
3. **Supprimer une tâche** : Faites glisser la tâche vers la gauche pour la supprimer. Une notification vous informera que la tâche a été supprimée.

## Captures d'Écran

*Ajoutez ici des captures d'écran de l'application si nécessaire.*

## Contribuer

1. Fork le projet.
2. Créez une branche pour votre fonctionnalité ou correction :
    ```sh
    git checkout -b ma-nouvelle-fonctionnalité
    ```
3. Effectuez vos modifications et commitez-les :
    ```sh
    git commit -am 'Ajout d\'une nouvelle fonctionnalité'
    ```
4. Poussez la branche vers le dépôt distant :
    ```sh
    git push origin ma-nouvelle-fonctionnalité
    ```
5. Ouvrez une pull request.

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.
