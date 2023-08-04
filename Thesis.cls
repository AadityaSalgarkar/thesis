%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis LaTeX Template - THESIS CLASS FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Thesis}[2018/04/14 v2.0 Thesis]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}



%---------------------------------------------------------------------------------
%	EXTRA PACKAGES
%---------------------------------------------------------------------------------

% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to use key value arguments in commands
\RequirePackage{keyval}
% Allows the use of international characters (e.g. Umlauts)
\RequirePackage[utf8]{inputenc} 
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Best table environment for latex
\RequirePackage{tabu}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr, lastpage}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to manage fraction
\RequirePackage{xfrac}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to configurate the line spacing
\RequirePackage{setspace}
% Extra math symbols and commands
\RequirePackage{amsmath,amsfonts,amssymb,amscd,amsbsy,amsthm,mathtools,textcomp,stackrel}
% Command for better spaces and arrows
\RequirePackage{xspace}
% Needed to configure captions
\RequirePackage[centerlast,small,sc]{caption}
% Needed to present graphics
\RequirePackage{graphicx}
% Needed to convert eps to pdf
\RequirePackage{epstopdf}
% Needed to configure hyperlinks
\RequirePackage{hyperref}
% Needed for better references
\RequirePackage[capitalize,noabbrev]{cleveref}
% Needed to include other pdf pages
\RequirePackage{pdfpages}
% Needed to add appendices separatly to each \part
\RequirePackage{appendix}
% Needed to \reset counters in each \part
\RequirePackage{chngcntr}
% Needed for figures
\RequirePackage{subcaption, float}
% Needed to draw figures
\RequirePackage{tikz}
% Needed to construct list of symbols, constants and abbreviations
\usepackage{longtable}
% Needed to list of tables, figures and 
\usepackage[titles]{tocloft}


%---------------------------------------------------------------------------------
%	CONFIGURE TODAY
%---------------------------------------------------------------------------------

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year
} % \today of the form "Month Year"



%---------------------------------------------------------------------------------
%	HYPERLINKS & REFERENCES
%---------------------------------------------------------------------------------

\hypersetup{pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks,citecolor=blue,urlcolor=blue,linkcolor=red,
   pdfstartview={FitV},unicode,breaklinks=true}

\pdfstringdefDisableCommands{\let\\\space}



%---------------------------------------------------------------------------------
%	MARGINS & GEOMETRY & PARAGRAPHS
%---------------------------------------------------------------------------------

\geometry{a4paper,
  bindingoffset=8mm,
	top=27mm,
	outer=23mm,
	inner=23mm,
  bottom=27mm,
  footskip=10mm,
  footnotesep=5mm plus 1mm minus 1mm
}


\raggedbottom
\setlength{\topskip}{1.1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.


\setstretch{1.35}
\setlength\parindent{0pt}
\setlength\parskip{5pt plus 1pt minus 1pt}



%---------------------------------------------------------------------------------
%	HEADER STYLE
%---------------------------------------------------------------------------------

\pagestyle{fancy}
\fancyheadoffset[L]{0pt}
\fancyhead[LE,RO]{\thepage}
%\fancyhead[LO,RE]{\thechapter}
\fancyfoot{}



%---------------------------------------------------------------------------------
%	UTILITIES
%---------------------------------------------------------------------------------

% Needed to help debuging problems in the compiler
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}

% Needed to add clear page for book type layout
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% Needed to make horizontal rule
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

% Needed to add content to TOC
\newcounter{dummy}
\newcommand\addtotoc[1]{%
  \refstepcounter{dummy}%
  \addcontentsline{toc}{chapter}{#1}%
}

% Needed to add asthetic spacing to TOC
\newcommand\addvspacetoc[1]{\addtocontents{toc}{\vspace{#1}}}

% Needed to bold the first letter in the next sentence
\def\b#1{\textbf{#1}}

% To reset chapter counter for every part
\def\resetpartcounters{%
	\counterwithin*{chapter}{part}
	\counterwithin{figure}{part}
	\counterwithin{equation}{part}
	\counterwithin{table}{part}
	\renewcommand*{\restoreapp}{}
}%

% To remove page number from \part
\newcommand\configbibliography[2][chapter]{%
  \phantomsection
  \setcounter{part}{0}
  \addcontentsline{toc}{#1}{#2}
  \fancyhead[LO]{\textsc{#2}}
  \renewcommand\bibname{#2}
}%

% To remove page number from \appendixpage
\let\appendixpageold\appendixpage
\renewcommand{\appendixpage}{%
  \begingroup
  \let\ps@plain\ps@empty
  \phantomsection
  \addcontentsline{toc}{part}{Appendices}
  \appendixpageold
  \endgroup
  \cleardoublepage
}%

% To remove page number from \part
\renewcommand\part{%
   \if@openright
     \cleardoublepage
   \else
     \clearpage
   \fi
   \thispagestyle{empty}%
   \if@twocolumn
     \onecolumn
     \@tempswatrue
   \else
     \@tempswafalse
   \fi
   \null\vfil
   \secdef\@part\@spart
}%



%---------------------------------------------------------------------------------
%	MATH RELATED
%---------------------------------------------------------------------------------

\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}



%---------------------------------------------------------------------------------
%	COUNTERS & RATIOS & LENGHTS
%---------------------------------------------------------------------------------

\newlength\@logoheight
\setlength\@logoheight{30mm}

\setlength{\captionmargin}{20pt}

\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}

\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}

\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}



%---------------------------------------------------------------------------------
%	REFERENCES
%---------------------------------------------------------------------------------

\renewcommand*{\eqref}[1]{(\ref{#1})}



%---------------------------------------------------------------------------------
%	THESIS RELATED COMMANDS
%---------------------------------------------------------------------------------

\newcommand*{\supervisor}[2][]{\def\@supervisor{\texorpdfstring{\href{#1}{#2}}{#2}}}
\newcommand*{\cosupervisor}[2][]{\def\@cosupervisor{\texorpdfstring{\href{#1}{#2}}{#2}}}
\newcommand*{\thesistitle}[2][]{%
  \ifstrempty{#1}{\def\@smalltitle{#2}}{\def\@smalltitle{#1}}
  \def\@thesistitle{#2}
  \fancyhead[RE]{\textsc{\@smalltitle}}
  \hypersetup{pdftitle={#2}}
}%
\newcommand*{\degree}[2]{%
  \def\@degreeother{#2}
  \def\@degree{#1}
}%
\newcommand*{\examiner}[2][]{\def\@examiner{\texorpdfstring{\href{#1}{#2}}{#2}}}
\renewcommand*{\author}[2][]{%
  \def\@author{\texorpdfstring{\href{#1}{#2}}{#2}}
  \hypersetup{pdfauthor={\@author}}
}%
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\university}[2][]{\def\@university{\texorpdfstring{\href{#1}{#2}}{#2}}}
\newcommand*{\department}[2][]{\def\@department{\texorpdfstring{\href{#1}{#2}}{#2}}}
\newcommand*{\group}[2][]{\def\@group{\texorpdfstring{\href{#1}{#2}}{#2}}}
\newcommand*{\faculty}[2][]{\def\@faculty{\texorpdfstring{\href{#1}{#2}}{#2}}}
\newcommand*{\subject}[1][]{%
  \def\@subject{#1}
  \hypersetup{pdfsubject={#1}}
}%
\newcommand*{\keywords}[1]{%
  \def\@keywords{#1}
  \hypersetup{pdfkeywords={#1}}
}%
\newcommand*{\logos}[2][30mm]{%
  \setlength\@logoheight{#1}
  \def\@logos{#2}
}%



%---------------------------------------------------------------------------------
%	FRONT/MAIN/BACK MATTER
%---------------------------------------------------------------------------------

\renewcommand\mainmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{fancy}
  \renewcommand*{\chaptermark}[1]{\markboth{\thechapter. \textsc{##1}}{}}
  \fancyhead[LO,RE]{\leftmark}
}%

\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
}%



%---------------------------------------------------------------------------------
%	TITLE PAGE DESIGN
%---------------------------------------------------------------------------------

\renewcommand\maketitle{% TITLE PAGE
  \btypeout{Title page}
  \thispagestyle{empty}%
  \begin{titlepage}%
    \topskip=0pt
    \begin{center}%
      \textsc{\LARGE\@university}%
      \\[15mm]
      \textsc{\Large\@degreeother\space Thesis}%
      \\[2mm]
      
      \HRule\\[4mm]% Horizontal line
      \begin{minipage}{0.90\textwidth}%
        \setstretch{1.1}\centering\huge\bfseries\@thesistitle
      \end{minipage}% Thesis title
      \\[5.5mm]
      \HRule\\[8mm]% Horizontal line
      
      \begin{minipage}[t]{0.4\textwidth}%
        \begin{flushleft}%
          \large\emph{Author:}\\\@author
        \end{flushleft}%
      \end{minipage}%
      \begin{minipage}[t]{0.4\textwidth}%
        \begin{flushright}%
          \large\emph{Supervisor:}\\%
          \@supervisor
          \ifdefined\@cosupervisor 
            \\[4mm]%
            \emph{Co-supervisor:}\\%
            \@cosupervisor
          \fi
        \end{flushright}%
      \end{minipage}%
      \\[15mm]
      
      \large\textit{A thesis submitted in fulfilment of the requirements\linebreak%
      for the degree of \@degree}%
      \\[2mm]
      \textit{at the}%
      \\[3mm]
      \ifdefined\@faculty\@faculty\\\fi
      \ifdefined\@department\@department\\\fi
      \ifdefined\@group\@group\\\fi
      \bigskip\bigskip
      {\large \today}\\% Date
      \vfill\vfill
      \ifdefined\@logos
        \foreach\lg in \@logos{%
          \hspace*{\fill}
          \includegraphics[height=\@logoheight]{\lg}% University/department logo
        }%
        \hspace*{\fill}
      \fi
    \end{center}%
  \end{titlepage}%
  \cleardoublepage
}%



%---------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%---------------------------------------------------------------------------------

\def\@abstitle{Abstract}
\def\@absdegree{\@degree}
\def\@absconnector{by}
\def\@absthesistitle{\@thesistitle}
\define@key{absenv}{title}{\def\@abstitle{#1}}
\define@key{absenv}{thesistitle}{\def\@absthesistitle{#1}}
\define@key{absenv}{degree}{\def\@absdegree{#1}}
\define@key{absenv}{nameconnector}{\def\@absconnector{#1}}

\newenvironment{abstract}[1][]
{%
  \setkeys{absenv}{#1}%
  \btypeout{\@abstitle}%
  \addtotoc{\@abstitle}%
  \thispagestyle{plain}%
  \fancyhead[LO]{\textsc{\@abstitle}}%
  \vspace*{15mm plus 0mm minus 10mm}%
  \begin{center}%
    \normalsize
    {\scshape\@university\\}% University name in capitals
    \bigskip
    {\huge\itshape\@abstitle\\}%
    \bigskip
    \ifdefined\@faculty\@faculty\\\fi% Faculty name
    \ifdefined\@department\@department\\\fi% Dept. name
    \ifdefined\@group\@group\\\fi% Group name
    \bigskip
    \@absdegree\par% Degree name
    \bigskip
    \parbox{0.8\textwidth}{\setstretch{1.1}\centering\bfseries\@absthesistitle}\\% Thesis title
    \medskip\smallskip
    \@absconnector\space\space\@author\\% Author name
    \bigskip
  \end{center}%
  \medskip
}{%
  \cleardoublepage
  \pagestyle{fancy}%
}%



%---------------------------------------------------------------------------------
%	TABLE OF CONTENTS PAGE DESIGN
%---------------------------------------------------------------------------------

\renewcommand\tableofcontents{%
  \btypeout{\contentsname}
  \addtotoc{\contentsname}
  \fancyhead[LO]{\textsc{\contentsname}}
  \begin{spacing}{1}{%
      \setlength{\parskip}{1pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \chapter*{\contentsname
          \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
      \@starttoc{toc}
      \if@restonecol\twocolumn\fi
  }\end{spacing}%
  \cleardoublepage
}%



%---------------------------------------------------------------------------------
%	LIST OF FIGURES PAGE DESIGN
%---------------------------------------------------------------------------------

\renewcommand\cftfigafterpnum{\vskip8pt\par}

\renewcommand\listoffigures{%
  \btypeout{\listfigurename}
  \addtotoc{\listfigurename}
  \fancyhead[LO]{\textsc{\listfigurename}}
  \begin{spacing}{1}{%
      \setlength{\parskip}{1pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \chapter*{\listfigurename
        \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}
      \@starttoc{lof}
      \if@restonecol\twocolumn\fi
  }\end{spacing}
  \cleardoublepage
}%



%---------------------------------------------------------------------------------
%	LIST OF TABLES PAGE DESIGN
%---------------------------------------------------------------------------------

\renewcommand\cfttabafterpnum{\vskip8pt\par}

\renewcommand\listoftables{%
  \btypeout{\listtablename}
  \addtotoc{\listtablename}
  \fancyhead[LO]{\textsc{\listtablename}}
  \begin{spacing}{1}{%
      \setlength{\parskip}{1pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \chapter*{\listtablename
        \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
      \@starttoc{lot}
      \if@restonecol\twocolumn\fi
  }\end{spacing}%
  \cleardoublepage
}%



%---------------------------------------------------------------------------------
%	LIST OF ABBREVIATIONS PAGE DESIGN
%---------------------------------------------------------------------------------

\newcommand\glossaryname{Abbreviations}

\renewenvironment{glossary}
{%
  \btypeout{\glossaryname}
  \addtotoc{\glossaryname}
  \fancyhead[LO]{\textsc{\glossaryname}}
  \chapter*{\glossaryname
      \@mkboth{\MakeUppercase\glossaryname}{\MakeUppercase\glossaryname}}
  \setlength{\tabcolsep}{1mm}
	\begin{longtable}[c]{r@{\hskip9mm}l}
}{%
    \hspace*{24mm} & \hspace*{13cm}
  \end{longtable}\par
  \cleardoublepage
}%

\newcommand\abbrev[2]{%
  \vspace{1.5mm}\textbf{#1}	& #2 \\
}%

%---------------------------------------------------------------------------------
%	PHYSICAL CONSTANTS PAGE DESIGN
%---------------------------------------------------------------------------------

\newcommand\listconstantsname{Physical Constants}

\newenvironment{listofcontants}
{%
  \btypeout{\listconstantsname}
  \addtotoc{\listconstantsname}
  \fancyhead[LO]{\textsc{\listconstantsname}}
  \chapter*{\listconstantsname
      \@mkboth{\MakeUppercase\listconstantsname}{\MakeUppercase\listconstantsname}}
  \setlength{\tabcolsep}{0.1cm}
	\begin{longtable}[c]{llcl} 
}{%
    \const[\phantom{$=$}]{}{\phantom{$mm/mm$}}{}
  \end{longtable}\par
  \cleardoublepage
}%

\newcommand\const[4][$=$]{%
  	\vspace{0.15cm}\hspace{0.4cm}\parbox{7cm}{\vspace{0.15cm}\setstretch{1} #2}\hspace{0.8cm} & #3 & #1 & \parbox{6cm}{\setstretch{1} #4} \\
}%



%---------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%---------------------------------------------------------------------------------

\newcommand\listsymbolsname{Symbols}

\newenvironment{listofsymbols}
{%
  \btypeout{\listsymbolsname}
  \addtotoc{\listsymbolsname}
  \fancyhead[LO]{\textsc{\listsymbolsname}}
  \chapter*{\listsymbolsname
      \@mkboth{\MakeUppercase\listsymbolsname}{\MakeUppercase\listsymbolsname}}
  \setlength{\tabcolsep}{0.1cm}
	\begin{longtable}[c]{l@{\hskip 2cm}l@{\hskip 2cm}l} 
}{%
    \symb{\phantom{$d$}}{\phantom{distance}}{\phantom{m}}
  \end{longtable}\par
  \cleardoublepage
}%

\newcommand\symb[3]{%
  	\vspace{0.15cm}#1 & #2 & #3 \\
}%



%---------------------------------------------------------------------------------
%	QUOTATION PAGE DESIGN
%---------------------------------------------------------------------------------

\newcommand\quotepage[2]{%
  \btypeout{Quote page}
  \vspace{1cm}
  \thispagestyle{empty} % Remove page number
  %\null\vfill % Add some space to move the quote down the page a bit
  \textit{``#2"}
  \begin{flushright}#1\end{flushright}
  %\vfill\vfill%\vfill\vfill\vfill\vfill\vfill\vfill\vfill%\null % Add some space at the bottom to position the quote just right
  %\cleardoublepage % Start a new page
}%



%---------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%---------------------------------------------------------------------------------

\newenvironment{acknowledgements}
{%
  \btypeout{Acknowledgements}
  \addtotoc{Acknowledgements}
  \pagestyle{empty}
  \begin{center}{\huge{\textit{Acknowledgements}}\par}\end{center}
  \vspace{3mm}
  \normalsize\normalfont
}{%
  \vfil\vfil\null
  \cleardoublepage
  \pagestyle{fancy}
}%


%---------------------------------------------------------------------------------
%	DEDICATORY PAGE DESIGN
%---------------------------------------------------------------------------------

\newenvironment{frontchapter}[1]
{%
  \btypeout{Dedicatory}
  \addtotoc{#1}
  \fancyhead[LO]{\textsc{#1}}
  \chapter*{#1}
}{%
  \vfil\null
  \cleardoublepage
}%



%---------------------------------------------------------------------------------
%	DEDICATORY PAGE DESIGN
%---------------------------------------------------------------------------------

\newenvironment{dedicatory}
{%
  \btypeout{Dedicatory}
  \thispagestyle{empty}
  \null\vfil
  \vskip 60\p@
  \begin{center}
    \Large \sl
}{%
  \end{center}
  \vfil\null
  \cleardoublepage
}%



%---------------------------------------------------------------------------------
%	DEDICATORY PAGE DESIGN
%---------------------------------------------------------------------------------

\newcommand\declaration[1]{%
  \btypeout{Declaration of Authorship}
  \addtotoc{Declaration of Authorship}
  \thispagestyle{plain}
  \null\vfil
  %\vskip 60\p@
  \begin{center}{\huge\bfseries Declaration of Authorship\par}\end{center}
  %\vskip 60\p@
  {\normalsize #1}
  \vfil\vfil\null
  %\cleardoublepage
}%



\endinput