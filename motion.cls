\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{motion}[2014-05-21 Motion]

\usepackage{xinttools}

%% Article options
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{11pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{titlepage}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{notitlepage}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Fallback to article options
\DeclareOption*{
 \PassOptionsToClass{\CurrentOption}{article}
}

%% Who signed the motion?
\def\@signatories{}
\newcommand{\signatories}[1]{\def\@signatories{#1}}
\newcommand{\showsignatories}{\@signatories}

%% How can they be reached?

\def\@email{}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\showemail}{\@email}


%% Execute default options
\ExecuteOptions{}

%% Process given options
\ProcessOptions\relax

%% Load base
 \LoadClass{article}

%% Environment for proposals

\newenvironment{proposals}
  {   \setlength{\parindent}{0pt}
      \vskip 3em%
      \begin{samepage}
      \large darfor yrkar vi\ldots
      \renewcommand{\labelitemi}{\ldots}
      \begin{itemize}
  }
  {   \end{itemize}
      \end{samepage}

  }



%% Include signatures
\newcommand\makesignatures{\xintFor ##1 in {\@signatories}\do {
    \vskip 1.5em%
    \par\noindent\makebox[2.5in]{\hrulefill} \hfill\makebox[2.0in]{\hrulefill}%
    \par\noindent\makebox[2.5in][l]{\textit{##1}}      \hfill\makebox[2.0in][l]{\textit{Ort, datum}}%
  }%
}

%% Create neater titles
  \if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large Forfattare: \@author \par}%  
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        Undertecknare: \showsignatories
      \end{tabular}\par}%
    \vskip 1.5em%
    {\large \texttt{\showemail} \par}%  
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax

}
\else
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \texttt{\showemail}
    \vskip 0.5em
    {\large \@date}%
  \end{center}%
  \par}
\fi


\endinput
