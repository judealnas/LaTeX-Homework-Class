\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hwcls}[Custom Article Class]

% Declare options accepted by the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
% Load the standard article class as a base
\LoadClass{article}

% Define the problem counter
\newcounter{problem}[section]

% Define the subproblem counter
\newcounter{subproblem}[problem]

% Redefine the \theproblem and \thesubproblem formatting
\renewcommand{\theproblem}{\arabic{problem}}
\renewcommand{\thesubproblem}{\theproblem.\roman{subproblem}}

% Define the \problem and \subproblem sectioning commands
\newcommand{\problem}[1]{%
  \refstepcounter{problem}%
  \section*{Problem \theproblem\quad#1}%
  \addcontentsline{toc}{section}{\theproblem\quad#1}%
}
\newcommand{\subproblem}[1]{%
  \refstepcounter{subproblem}%
  \subsection*{Question \thesubproblem\quad#1}%
  \addcontentsline{toc}{subsection}{\thesubproblem\quad#1}%
}

\endinput
