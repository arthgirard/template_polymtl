# Gabarit LaTeX pour Polytechnique Montréal (poly.cls) / Polytechnique Montréal LaTeX Template

Ce dépôt contient la classe LaTeX officielle `poly.cls` et ses fichiers de configuration associés pour la rédaction de rapports et travaux à Polytechnique Montréal.

This repository contains the `poly.cls` LaTeX class and associated configuration files for writing reports and projects at Polytechnique Montréal.

---

## Table des matières / Table of Contents

1. [Français](#français)
    * [Description](#description)
    * [Fonctionnalités principales](#fonctionnalités-principales)
    * [Structure du dépôt](#structure-du-dépôt)
    * [Prérequis et Dépendances](#prérequis-et-dépendances)
    * [Guide d'utilisation](#guide-dutilisation)
    * [Compilation](#compilation)
2. [English](#english)
    * [Description (EN)](#description-en)
    * [Key Features](#key-features)
    * [Repository Structure](#repository-structure)
    * [Prerequisites and Dependencies](#prerequisites-and-dependencies)
    * [User Guide](#user-guide)
    * [Compilation (EN)](#compilation-en)

---

## Français

### Description

Le package `poly.cls` est une classe LaTeX basée sur la classe standard `article`, configurée sur mesure pour répondre aux exigences graphiques et académiques de Polytechnique Montréal. Elle automatise la création d'une page de titre standardisée, configure la palette de couleurs officielle, gère les paquets de notation scientifique, et fournit des exemples complets d'intégration de graphiques, codes sources et tableaux complexes.

### Fonctionnalités principales

* **Page de titre institutionnelle** : Génération automatisée via `\maketitle` incluant le logo, le titre, le sous-titre, le nom du professeur, le sigle et titre du cours, le département ainsi qu'un tableau dynamique pour la liste des membres de l'équipe et leurs matricules.
* **Charte graphique respectée** : Définition de couleurs spécifiques pour la hiérarchie des titres (`\section` en rouge Polytechnique, `\subsection` en rouge doux, `\subsubsection` en rouge foncé).
* **Configuration linguistique** : Intégration native de Babel en français, avec gestion automatique de la ponctuation et de l'espacement.
* **Notation scientifique avancée** : Paquet `siunitx` préconfiguré pour les normes francophones comme la virgule décimale, les séparateurs de groupes et les unités standards.
* **Formules chimiques** : Intégration de `mhchem` pour l'écriture simplifiée des formules et réactions chimiques.
* **Mise en page de production** : Support pour les tableaux avancés (`booktabs`, `tabularx`, `nicematrix`), les figures et sous-figures (`subcaption`), le mode paysage (`pdflscape`), les colonnes multiples (`multicol`), et les notes de révision intégrées (`todonotes`).
* **Gestion du code source** : Configuration du paquet `listings` avec la police `Inconsolata` et une coloration syntaxique harmonisée.
* **Références et bibliographie** : Gestion moderne via `biblatex` (moteur `biber`) configurée selon le style IEEE, associée au paquet `cleveref` pour des références croisées dynamiques et bilingues.

### Structure du dépôt

* `.gitignore` : Fichiers auxiliaires LaTeX et configurations d'éditeurs à ignorer lors des commits.
* `poly.cls` : Classe LaTeX principale contenant l'ensemble des définitions de styles, de couleurs et de structures documentaires.
* `main.tex` : Document d'exemple minimaliste pour démarrer rapidement un nouveau projet.
* `template.tex` : Gabarit exhaustif documentant et illustrant l'ensemble des fonctionnalités de la classe.
* `references.bib` : Base de données bibliographiques au format BibTeX contenant les références d'exemple.
* `figures/poly-logo.png` : Logo officiel de Polytechnique Montréal utilisé pour la page de couverture.

### Prérequis et Dépendances

Une distribution LaTeX moderne et complète est requise pour exploiter ce gabarit :
* **Linux** : TeX Live (l'installation du paquet complet `texlive-full` est recommandée).
* **macOS** : MacTeX.
* **Windows** : MiKTeX ou TeX Live.

Moteurs et outils logiciels obligatoires :
* Compilateur : `pdflatex` ou `xelatex`.
* Gestionnaire bibliographique : `biber` (requis pour le traitement par `biblatex`).
* Police de caractères : Les polices `Inconsolata` et `Helvetica` doivent être présentes dans la distribution.

### Guide d'utilisation

Pour initialiser votre document, copiez l'ensemble des fichiers du dépôt dans votre répertoire de projet et modifiez le fichier `main.tex`.

#### Configuration de la page de titre

Remplissez les variables de métadonnées directement dans le préambule de votre document :

```latex
\documentclass{poly}

\title{Titre de votre rapport}
\subtitle{Sous-titre optionnel}
\professor{Nom du professeur}
\sigle{Sigle}
\coursetitle{Cours}
\department{Département}

\addmember{Prénom Nom}{1234567}
\addmember{Deuxième Membre}{7654321}
\date{\today}
```

#### Insertion d'unités SI

Utilisez l'API du paquet `siunitx` pour garantir la conformité avec les règles typographiques locales :

```latex
La masse mesurée est de \SI{12,45 \pm 0,02}{\kilogram}.
La vitesse de la lumière est de \num{2,998e8}~\si{\metre\per\second}.
```

### Compilation

Le projet s'appuie sur `biber` pour la génération des index bibliographiques. La séquence de compilation native s'exécute comme suit :

```bash
pdflatex template.tex
biber template
pdflatex template.tex
pdflatex template.tex
```

Si votre environnement intègre l'utilitaire d'automatisation `latexmk`, vous pouvez compiler le projet en une seule opération :

```bash
latexmk -pdf template.tex
```

Pour nettoyer les fichiers intermédiaires et auxiliaires générés par la compilation :

```bash
latexmk -c
```

---

## English

### Description <a id="description-en"></a>

The `poly.cls` package is a custom LaTeX class built upon the standard `article` class, engineered to satisfy the explicit graphical and academic constraints of Polytechnique Montréal. It automates the generation of a compliant institutional title page, defines the official corporate color standard, configures technical and scientific packages, and provides deployment examples for complex tables, programmatic source code, vector graphics, and automated cross-references.

### Key Features

* **Institutional Title Page**: Automated generation using `\maketitle` that formats the university logo, report title, optional subtitle, professor name, course code and title, academic department, and a dynamic table for team members along with their student IDs.
* **Corporate Visual Identity**: Strict enforcement of the official color scheme across heading levels (`\section` in Polytechnique corporate red, `\subsection` in soft red, `\subsubsection` in dark red).
* **Localization**: Full integration with Babel configured for French language output, handling automatic punctuation spacing and standard typographic rules.
* **Advanced Scientific Notation**: Pre-configured `siunitx` package tuned for regional engineering notation, including comma decimal markers, digit grouping, and standard international units.
* **Chemical Equations**: Native implementation of `mhchem` for rendering structured chemical formulas and equilibrium equations.
* **Production-Grade Layouts**: Out-of-the-box support for professional tables (`booktabs`, `tabularx`, `nicematrix`), graphics and subfigures (`subcaption`), landscape rendering (`pdflscape`), multi-column layouts (`multicol`), and inline review markers (`todonotes`).
* **Source Code Blocks**: Custom styling for the `listings` package using the `Inconsolata` monospace font with precise syntactic color coding.
* **References and Citation**: Modern bibliography engine powered by `biblatex` and `biber` tracking the IEEE specification, linked with `cleveref` for automated, context-aware cross-referencing.

### Repository Structure

* `.gitignore` : Definition of LaTeX auxiliary extensions and local text editor tracking files to exclude from version control.
* `poly.cls` : Primary LaTeX class file containing core style logic, color constants, and structural packages.
* `main.tex` : Minimal skeleton document providing a clean starting point for any compatible report.
* `template.tex` : Comprehensive documentation file showcasing implementation examples for every feature built into the class.
* `references.bib` : Sample BibTeX database populated with reference entries used across the templates.
* `figures/poly-logo.png` : Official corporate logo file required by the title page layout engine.

### Prerequisites and Dependencies

A modern, comprehensive LaTeX distribution is required to compile documents with this class:
* **Linux** : TeX Live (the `texlive-full` meta-package is highly recommended).
* **macOS** : MacTeX distribution.
* **Windows** : MiKTeX or TeX Live.

Required toolchains and assets:
* Compiler: `pdflatex` or `xelatex`.
* Bibliography processor: `biber` (mandatory for parsing `biblatex` fields).
* System Fonts: The `Inconsolata` and `Helvetica` typefaces must be accessible to the LaTeX compiler.

### User Guide

To initialize your project, copy all repository files into your local directory and begin modifying the `main.tex` entry point.

#### Title Page Configuration

Provide your specific document metadata within the preamble section:

```latex
\documentclass{poly}

\title{Your Report Title}
\subtitle{Optional Subtitle}
\professor{Professor's Name}
\sigle{Course code}
\coursetitle{Course title}
\department{Department}

\addmember{Firstname Lastname}{1234567}
\addmember{Second Member}{7654321}
\date{\today}
```

#### Formatting SI Units

Invoke `siunitx` macro wrappers to ensure standardized mathematical and engineering typography:

```latex
The measured mass is \SI{12,45 \pm 0,02}{\kilogram}.
The speed of light is \num{2,998e8}~\si{\metre\per\second}.
```

### Compilation <a id="compilation-en"></a>

This environment uses `biber` to format bibliographies and citations. The traditional iterative compilation sequence is executed as follows:

```bash
pdflatex template.tex
biber template
pdflatex template.tex
pdflatex template.tex
```

If your toolchain includes the `latexmk` automation engine, you can run the entire build sequence with a single call:

```bash
latexmk -pdf template.tex
```

To purge the workspace of intermediate auxiliary files generated during compilation:

```bash
latexmk -c
```
