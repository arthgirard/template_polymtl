\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{poly}[2026/05/15 - Polytechnique Montréal]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[12pt, letterpaper]{article}

% Fonts & symbols
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{inconsolata}
\RequirePackage{microtype}
\RequirePackage[nointegrals]{wasysym}
\RequirePackage{amsmath, amssymb}
\RequirePackage[scaled]{helvet}
\renewcommand{\familydefault}{\sfdefault}

% Page layout
\RequirePackage[
    paperheight = 11in,
    paperwidth = 8.5in,
    margin = 1in,
]{geometry}
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage{multicol}
\RequirePackage{parskip}
\RequirePackage{tabto}
\RequirePackage{pdflscape}
\RequirePackage{enumitem}
\RequirePackage{adjustbox}
\RequirePackage[super]{nth}
\RequirePackage{fancyhdr}
\setlength{\headheight}{14.49998pt}

% Science
\RequirePackage[
    arc-separator = \,,
    retain-explicit-plus,
    inter-unit-product = \cdot,
    detect-weight = true,
    detect-family = true,
    range-phrase = --,
    range-units = single,
    output-decimal-marker = {,},
    group-separator = {\,},
    group-minimum-digits = 4,
    tight-spacing = true,
    separate-uncertainty = true,
    per-mode = power % use "symbol" for a "/" in between
]{siunitx}
\RequirePackage[version=4]{mhchem}
\RequirePackage{nicematrix}
\RequirePackage[makeroom]{cancel}
\RequirePackage{bm}

% Language
\RequirePackage[french]{babel}
\RequirePackage[style=french]{csquotes}

% Graphics, captions, tables
\RequirePackage[table, dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[
    justification = justified,
    singlelinecheck = true,
    labelsep=endash
]{caption}
\RequirePackage{booktabs}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{tikz,tikz-3dplot}
\usetikzlibrary{patterns}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{pdfpages}
\RequirePackage[outline]{contour}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{todonotes}

% Couleurs & titres
\definecolor{titre}{RGB}{180, 52, 18}
\definecolor{soustitre}{RGB}{241, 147, 122}
\definecolor{sousoustitre}{RGB}{119, 35, 12}

\titleformat{\section}
    {\fontsize{17}{20.4}\selectfont\mdseries\color{titre}}
    {\thesection}{1em}{}
\titleformat{\subsection}
    {\fontsize{13}{15.6}\selectfont\mdseries\color{soustitre}}
    {\thesubsection}{1em}{}
\titleformat{\subsubsection}
    {\fontsize{12}{14.4}\selectfont\mdseries\color{sousoustitre}}
    {\thesubsubsection}{1em}{}

% Bibliographie & nomenclature
\RequirePackage[
    backend = biber,
    style = ieee,
    sorting = none,
]{biblatex}
\RequirePackage{nomencl} % OPTIONNEL
\makenomenclature
\renewcommand{\nomname}{Liste des abbréviations}

% Références
\RequirePackage[hidelinks]{hyperref} % doit être chargé en dernier (sauf pour cleveref)

\RequirePackage[french, noabbrev, capitalize]{cleveref} % for better refs
\crefname{figure}{figure}{figures}
\Crefname{figure}{Figure}{Figures}
\crefname{table}{tableau}{tableaux}
\Crefname{table}{Tableau}{Tableaux}
\crefname{equation}{équation}{équations}
\Crefname{equation}{Équation}{Équations}
\crefname{section}{section}{sections}
\Crefname{section}{Section}{Sections}
\crefname{appendix}{annexe}{annexes}
\Crefname{appendix}{Annexe}{Annexes}
\crefname{lstlisting}{listing}{listings}
\Crefname{lstlisting}{Listing}{Listings}

\AtBeginDocument{
  \shorthandoff{:} % nécessaire pour faire fonctionner cleveref avec french babel
  \hypersetup{ % metadatas
    pdftitle  = {\@title},
    pdfauthor = {\@headernames},
    pdfsubject = {\@sigle\ --\ \@coursetitle},
  }
}

% Code
\RequirePackage{listings}

\lstdefinestyle{poly}{
    basicstyle = \ttfamily\small,
    keywordstyle = \color{titre}\bfseries,
    commentstyle = \color{gray}\itshape,
    stringstyle = \color{soustitre},
    numberstyle = \ttfamily\tiny\color{gray},
    numbers = left,
    numbersep = 8pt,
    frame = single,
    rulecolor = \color{gray!40},
    backgroundcolor = \color{gray!5},
    breaklines = true,
    captionpos = b,
    showstringspaces = false,
    tabsize = 4,
}
\lstset{style=poly}

% Page titre
\def\@subtitle{}
\def\@professor{}
\def\@sigle{}
\def\@coursetitle{}
\def\@department{Département de génie mécanique}
\def\@logopath{figures/poly-logo}
\def\@members{}

\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\professor}[1]{\def\@professor{#1}}
\newcommand{\sigle}[1]{\def\@sigle{#1}}
\newcommand{\coursetitle}[1]{\def\@coursetitle{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\logopath}[1]{\def\@logopath{#1}}
\def\@members{}
\def\@headernames{}
\newcommand{\addmember}[2]{%
  \g@addto@macro\@members{%
    \centering\bfseries #1 & \centering\arraybackslash #2 \\%
  }%
  \ifx\@headernames\empty
    \g@addto@macro\@headernames{#1}%
  \else
    \g@addto@macro\@headernames{, #1}%
  \fi
}

\renewcommand{\maketitle}{
    \begin{titlepage}\centering
        \includegraphics[width=0.44\textwidth]{\@logopath}\\\vfill
        {\large\bfseries\@title\\}
        \ifx\@subtitle\empty\else{\normalsize\@subtitle\\}\fi\vfill
        \ifx\@professor\empty\else{\normalsize Travail présenté à\\\@professor\\}\fi\vfill
        {\normalsize\ifx\@sigle\empty\else\@sigle{} : \@coursetitle\\\fi\@department\\}\vfill
        \renewcommand{\tabularxcolumn}[1]{>{\centering\arraybackslash}b{##1}}%
        \begin{tabularx}{\textwidth}{|X X|}
            \hline
            \rowcolor{black}
            \textcolor{white}{\textbf{Nom}} & \textcolor{white}{\textbf{Matricule}} \\
            \hline
            \@members
            \hline
        \end{tabularx}\vfill
        {\normalsize Polytechnique Montréal\\\@date\\}
    \end{titlepage}
    \pagestyle{fancy}
    \renewcommand{\headrulewidth}{0pt}
    \lhead{\@headernames}
    \rhead{\@title}
    \rfoot{\thepage}
    \cfoot{}
    \setcounter{page}{1}
    \lhead{\fontsize{10}{12}\selectfont\@headernames}
    \rhead{\fontsize{10}{12}\selectfont\@title}
}
