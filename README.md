# ESILV Shop

Application de boutique développée avec **Flutter et Dart**, dans un contexte pédagogique ESILV. Catalogue distant, fiches produits et panier réactif composent un parcours simple de découverte et de sélection de produits.

## Fonctionnalités

- Catalogue chargé en HTTP depuis Fake Store API.
- Fiche produit avec description, prix et note.
- Ajout et retrait de produits, total du panier et état vide.
- Navigation avec `go_router` et gestion du panier avec `Provider`.

## Démarrage

Installer Flutter avec un SDK Dart compatible avec `pubspec.yaml`, puis :

```sh
flutter pub get
flutter run -d chrome
```

Une connexion Internet est nécessaire pour le catalogue et les images. Les dossiers Android et iOS sont également fournis ; leur compilation exige les outils de la plateforme.

## Structure

```text
lib/
  app.dart                 # Application et routes
  main.dart                # Point d’entrée
  model/                   # Produit et panier
  page/                    # Catalogue, détail et panier
test/widget_test.dart      # Sérialisation, calcul et panier vide
```

## Validation

```sh
flutter test
flutter analyze
```

Trois tests vérifient la sérialisation des notes, le calcul du total avec doublons et retraits, et l’affichage du panier vide. Le résultat des vérifications locales est consigné dans le bilan de publication ; ces commandes permettent de les reproduire.

## Périmètre

Prototype pédagogique : pas de paiement, de compte client, de commande serveur ni de persistance du panier. Les prix sont présentés en euros à des fins de démonstration, sans conversion de devise. La gestion des erreurs réseau reste à améliorer.

Le projet utilise des données de démonstration de [Fake Store API](https://fakestoreapi.com/). Le dépôt représente une version de travail issue du projet pédagogique, avec corrections et documentation préparées avec assistance IA ; il ne revendique pas l’auteur exclusif des ressources de cours ou des dépendances.
