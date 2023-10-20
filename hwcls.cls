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

\newcommand{\problem}[1]{
  \refstepcounter{problem}%
  \ifx&#1& % Check if #1 is empty
    \section*{Problem \theproblem}%
    \addcontentsline{toc}{section}{Problem \theproblem}%
    \else
    \section*{Problem \theproblem:\ #1}%
    \addcontentsline{toc}{section}{Problem \theproblem:\ #1}%
  \fi
}

\newcommand{\subproblem}[1]{
  \refstepcounter{subproblem}%
  \ifx&#1& % Check if #1 is empty
    \subsection*{Question \thesubproblem}%
    \addcontentsline{toc}{subsection}{Question \thesubproblem}%
    \else
    \subsection*{Question \thesubproblem:\ #1}%
    \addcontentsline{toc}{subsection}{Question \thesubproblem:\ #1}%
  \fi
}

\AtBeginDocument{%
  % Check if cleveref package is already loaded
  \@ifpackageloaded{cleveref}{%
    % Check if \Crefname is defined for the problem counter, and define it if not
    \ifcsname c@problem\endcsname
      \ifx\cref@problem@name\@undefined
        \Crefname{problem}{Problem}{Problems}
      \fi
    \fi

    % Check if \Crefname is defined for the subproblem counter, and define it if not
    \ifcsname c@subproblem\endcsname
      \ifx\cref@subproblem@name\@undefined
        \Crefname{subproblem}{Question}{Questions}
      \fi
    \fi
  }{}% End of \@ifpackageloaded
}

\endinput
