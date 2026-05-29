<img src="figures/poly-logo.png" height="50px" align="left" alt="Polytechnique Montréal"/>
# Gabarit LaTeX — Polytechnique Montréal
 
Classe LaTeX clé-en-main pour rédiger des rapports techniques conformes aux normes graphiques de Polytechnique Montréal.
 
[![Compile LaTeX](https://github.com/arthgirard/polymtl_latex/actions/workflows/compile.yml/badge.svg)](https://github.com/arthgirard/polymtl_latex/actions/workflows/compile.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PDF](https://img.shields.io/badge/template-PDF-red.svg)](https://github.com/arthgirard/polymtl_latex/releases/download/latest/template.pdf)

---

## Table des matières

* [Description du projet](#description)
* [Fonctionnalités de la classe](#fonctionnalités-de-la-classe)
* [Structure des fichiers](#structure-des-fichiers)
* [Prérequis système](#prérequis-système)
* [Guide de démarrage](#guide-de-démarrage)
* [Protocoles de compilation](#protocoles-de-compilation)

---

## Description

Le fichier de classe `poly.cls` dérive de la structure standard `article` de LaTeX. Il centralise et préconfigure un ensemble de paquets essentiels afin de simplifier la mise en page tout en garantissant une conformité visuelle stricte avec les normes graphiques et académiques de Polytechnique Montréal. Cette approche évite l'accumulation de packages contradictoires dans le préambule des documents utilisateurs.

---

## Fonctionnalités de la classe

#### Page de titre institutionnelle
La commande `\maketitle` génère une couverture normalisée contenant l'emblème de l'école, les métadonnées du cours (sigle, titre, département) et la table des auteurs associée à leurs matricules respectifs.

#### Identité visuelle
Les commandes de sectionnement (`\section`, `\subsection`, `\subsubsection`) intègrent les déclinaisons de rouge de la charte officielle pour structurer la hiérarchie du rapport sans intervention manuelle.

#### Typographie et notation scientifique
Le moteur applique les règles d'écriture scientifique francophones via le paquet `siunitx`. Il prend également en charge l'écriture simplifiée des formules chimiques via `mhchem`.

#### Mises en page avancées
Le système gère nativement les structures complexes telles que les tableaux de production (`booktabs`, `tabularx`), l'affichage de sous-figures, l'orientation sélective de pages en mode paysage et l'insertion de notes de travail de type `todonotes`.

#### Traitement du code et des citations
Le package `listings` est paramétré avec la police monospacée `Inconsolata` pour restituer des blocs de code lisibles. L'appareil bibliographique s'appuie sur `biblatex` pour générer des index conformes à la norme IEEE.

---

## Structure des fichiers

* `poly.cls` : Noyau du gabarit définissant les styles, les packages requis et les paramètres de mise en page.
* `main.tex` : Squelette de document minimal pour initialiser rapidement la rédaction.
* `template.tex` : Guide exhaustif présentant des exemples d'implémentation pour chaque structure supportée.
* `references.bib` : Base de données au format BibTeX contenant les entrées bibliographiques du projet.
* `.gitignore` : Filtres d'exclusion configurés pour ignorer les fichiers auxiliaires générés par LaTeX.
* `figures/poly-logo.png` : Fichier graphique officiel indispensable à la compilation de la page de couverture.

---

## Prérequis système

L'utilisation de cette classe requiert l'installation d'une distribution LaTeX moderne (TeX Live, MacTeX ou MiKTeX).

Les utilitaires suivants doivent être accessibles :
* Compilateur : `pdflatex` ou `xelatex`
* Gestionnaire de bibliographie : `biber`
* Polices système : Les paquetages pour `Inconsolata` et `Helvetica` doivent être installés

---

## Guide de démarrage

Copiez l'intégralité des fichiers dans votre espace de travail et utilisez `main.tex` comme fichier racine.

### Initialisation du préambule

Configurez les métadonnées de votre équipe avant le marqueur de début de document :

```latex
\documentclass{poly}

\title{Titre du rapport}
\subtitle{Sous-titre du projet}
\professor{Nom de l'enseignant}
\sigle{SIG1234}
\coursetitle{Titre du cours}
\department{Département}

\addmember{Premier collaborateur}{1234567}
\addmember{Second collaborateur}{2345678}
% \addmember{Autres collaborateurs}{3456789}
\date{\today}
```

### Écriture des données techniques

Exploitez les macros dédiées pour assurer la régularité des espaces et des symboles :

```latex
Le module de Young mesuré s'élève à \SI{69}{\giga\pascal}.
La constante physique est estimée à \num{2,998e8}~\si{\metre\per\second}.
```

---

## Protocoles de compilation

### Méthode standard

L'indexation de la bibliographie nécessite plusieurs passes successives pour résoudre les liens croisés :

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### Méthode automatisée

Si l'outil `latexmk` est installé sur votre système, exécutez la commande suivante pour gérer l'ensemble du cycle de génération automatiquement :

```bash
latexmk -pdf main.tex
```

Pour nettoyer le répertoire des fichiers temporaires à la fin du travail :

```bash
latexmk -c
```
