\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{customcv}[2024/06/29 Custom CV]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Load necessary packages
\RequirePackage[a4paper]{geometry} % For setting page dimensions
\RequirePackage{xcolor} % For defining colors
\RequirePackage{fontspec} % For custom fonts
\RequirePackage{titlesec} % For customizing section titles
\RequirePackage{enumitem} % For customizing itemize environment
\RequirePackage{tcolorbox}

% Load main font from TTF file(s)
\setmainfont[
    Path = ./SpaceGrotesk/,
    UprightFont = SpaceGrotesk-Regular.ttf,
    BoldFont = SpaceGrotesk-Bold.ttf,
    Scale = 1.0
]{Space Grotesk}

% Define default accent color
\definecolor{accentcolor}{RGB}{0, 102, 204}

% Remove paragraph indentation
\setlength{\parindent}{0cm}

% Set document margins
\geometry{
    top=0cm, % The top margin is handled by the \header command
    bottom=1cm,
    left=2cm,
    right=2cm,
}

% Define header environment & co.

\newcommand{\cvdetailsep}{\hspace{0.5em}$\bullet$\hspace{0.5em}}

% TODO unused for now...
\newenvironment{cvdetails}
    {
        \begingroup
        \def\par{\cvdetailsep}%
        \obeylines
    }
    {
        \endgroup
    }

\newcommand{\cvheader}[2]{%
    \begin{tcolorbox}[colback=accentcolor, boxrule=0mm, width=\textwidth, left=-1.33mm, grow to left by=2cm, grow to right by=2cm, arc=0mm, outer arc=0mm]%
        \color{white}%
        \begin{minipage}[t]{\textwidth}%
            \vspace{0.5em}%
            \hspace{2cm}%
            {\Huge\textbf{#1}\par}%
            \vspace{0.5em}%
            \hspace{2cm}%
            % TODO this is where I would like to use the `cvdetails` environment, but it seems that #2 is already expanded so it doesn't work
            #2%
            \vspace{0.5em}%
        \end{minipage}%
    \end{tcolorbox}%
}

% Customize section titles
\titleformat{\section}
  {\Large\color{accentcolor}\bfseries} % Formatting for section titles
  {} % Label
  {0em} % Horizontal space between label and title
  {} % Code before title
  [\vspace{-0.75em}\rule{\linewidth}{0.5pt}] % After code

% Define custom itemize environment
\setlist[itemize]{
  leftmargin=2em, % Indentation for the entire itemize environment
  label=$\bullet$,
  labelsep=0.5em, % Distance between bullets and text
  topsep=0.5em,
  parsep=0em,
  itemsep=0.5em,
}

% Define entry command
\newcommand{\entry}[3]{%
  \textbf{#1}{ }\ifx?#2?\else{|}\fi { #2}\hfill \textbf{#3}%
}

% Allow the user to customize the accent color
\newcommand{\setaccentcolor}[1]{\definecolor{accentcolor}{RGB}{#1}}

% Suppress page numbers in footer
\pagestyle{empty}
