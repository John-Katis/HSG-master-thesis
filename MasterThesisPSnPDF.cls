%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``PhD Thesis PSnPDF''                                                %%
%%                                                                            %%
%% A PhD thesis LaTeX template for Cambridge University Engineering Department%%
%%                                                                            %%
%% Version: v2.4                                                              %%
%% Authors: Krishna Kumar                                                     %%
%% License: MIT License (c) 2016-2018 Krishna Kumar                           %%
%% GitHub Repo: https://github.com/kks32/phd-thesis-template/                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{2.4}
\newcommand\filedate{2018/04/12}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MasterThesisPSnPDF}[\filedate\space A Master thesis class file adpated from a PhD thesis class file by Krishna Kumar (v\fileversion)]
\typeout{https://github.com/kks32/phd-thesis-template/}


% ******************************************************************************
% **************************** Class Definition ********************************
% ******************************************************************************

% ******************************* Font Option **********************************
\newif\ifsetFont\setFontfalse                 % Font is not set

\newif\ifPHD@times\PHD@timesfalse             % Times with Math Support
\DeclareOption{times}{
  \ifsetFont
    \ClassWarning{MasterThesisPSnPDF}{Font selection conflict: A font package was
      already specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \PHD@timestrue
    \setFonttrue
  \fi
}

\newif\ifPHD@fourier\PHD@fourierfalse         % Fourier with Math Support
\DeclareOption{fourier}{
  \ifsetFont
    \ClassWarning{MasterThesisPSnPDF}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \PHD@fouriertrue
    \setFonttrue
  \fi
}

% \newif\iftsetCustomFont\setCustomFontfalse     % Custom Font with Math Support
% \DeclareOption{customfont}{
%   \ifsetFont
%     \ClassWarning{MasterThesisPSnPDF}{Font selection conflict: A font package was
%       aleady specified. Please check the document class options in case you 
%       have defined two fonts.}
%   \else
%     \setCustomFonttrue
%     \setFonttrue
%   \fi
% }

% ******************************* Bibliography *********************************
\newif\ifsetBib\setBibfalse                   % Custom Bibliography = true/false
\newif\ifsetBiBLaTeX\setBiBLaTeXfalse         % BiBLaTeX = True / False

\newif\ifPHD@biblatex\PHD@biblatexfalse       % BiBLaTeX
\DeclareOption{biblatex}{
  \ifsetBib
    \ClassWarning{MasterThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@biblatextrue
  \fi
}

% ************************* Header / Footer Styling ****************************
\newif\ifPHD@textJustify\PHD@textJustifytrue % Set Justification true
\DeclareOption{flushleft}{\PHD@textJustifyfalse}


% ************************* Header / Footer Styling ****************************
\newif\ifPHD@pageStyleI\PHD@pageStyleIfalse % Set Page StyleI
\DeclareOption{PageStyleI}{\PHD@pageStyleItrue}

\newif\ifPHD@pageStyleII\PHD@pageStyleIIfalse % Set Page StyleII
\DeclareOption{PageStyleII}{\PHD@pageStyleIItrue}

% ***************************** Custom Margins  ********************************
\newif\ifsetCustomMargin\setCustomMarginfalse % Set Custom Margin
\newif\ifsetMargin\setMarginfalse % Set Custom Margin
\DeclareOption{custommargin}{\setCustomMargintrue}

% *************************** Pre-defined Options ******************************
% Font Size
\DeclareOption{10pt}{
  \ClassWarning{MasterThesisPSnPDF}{The University of Cambridge PhD thesis guidelines
recommend using a minimum font size of 11pt (12pt is preferred) and 10pt for
footnotes.}
  \PassOptionsToClass{10pt}{book}%
}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}%

% Page Size
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper

\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\PHD@papersize{a5paper}}
\DeclareOption{letterpaper}{
  \ClassWarning{MasterThesisPSnPDF}{The University of Cambridge
    PhD thesis guidelines recommend using A4 or A5paper}
  \renewcommand\PHD@papersize{letterpaper}
}

\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% Process options and load class
\ProcessOptions\relax%
\LoadClass{book}%

% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************
% ************************** Layout and Formatting *****************************

\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
% \RequirePackage{calc}     % calculate vertical spacing

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX

% *********************** Table of Contents & Appendices ***********************
% add Bibliography, List of figures and tables to contents
\RequirePackage[nottoc]{tocbibind}
% Add appendices
\RequirePackage[title,titletoc]{appendix}
\RequirePackage{listings}
\RequirePackage{algorithm}

\renewcommand{\contentsname}{Table of Contents}
\newcommand{\listalgorithmsname}{List of Algorithms}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\lstlistlistingname}{List of Listings}
\renewcommand{\listtablename}{List of Tables}

\let\orig@listofalgorithms\listofalgorithms
\renewcommand{\listofalgorithms}{%
    \begingroup
    \cleardoublepage
    % eliminate clearpage in listlistoflistings macro
    \let\cleardoublepage\relax
    \let\clearpage\relax
    \addcontentsline{toc}{chapter}{\listalgorithmsname}
    \orig@listofalgorithms
    \endgroup
}

\let\orig@lstlistoflistings\lstlistoflistings
\renewcommand{\lstlistoflistings}{%
    \begingroup
    \cleardoublepage
    % eliminate clearpage in listlistoflistings macro
    \let\cleardoublepage\relax
    \let\clearpage\relax
    \addcontentsline{toc}{chapter}{\lstlistlistingname}
    \let\footnotemark\relax
    \orig@lstlistoflistings
    \endgroup
}

% Hides Contents appearing from TOC, but adds it to bookmarks
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \pdfbookmark[0]{\contentsname}{Contents}
  \temptableofcontents
}

% =========================== List of abbreviations ===========================

% Initialize the abbreviation list
\newcommand{\abbreviationlist}{}

% Command for users to define abbreviations
\newcommand{\newabbreviation}[2]{%
  % Append new abbreviation to the list
  \g@addto@macro\abbreviationlist{%
    \item[\textbf{#1}] #2
  }%
}

% Command to generate the list of abbreviations
\newcommand{\listofabbreviations}{%
  \chapter*{List of Abbreviations}
  \addcontentsline{toc}{chapter}{List of Abbreviations}
  \begin{description}[labelwidth=2.5cm, leftmargin=3cm]
    \abbreviationlist 
  \end{description}
}

% *************************** Graphics and Figures *****************************
\RequirePackage[usenames, dvipsnames]{color}
\ifpdf
  % Convert eps figures to pdf
  \RequirePackage{epstopdf}
  \RequirePackage[pdftex]{graphicx}
  \DeclareGraphicsExtensions{.png, .jpg, .pdf}
  \pdfcompresslevel=9
  \graphicspath{{Figs/Raster/}{Figs/}}
\else
  \RequirePackage{graphicx}
  \DeclareGraphicsExtensions{.eps, .ps}
  \graphicspath{{Figs/Vector/}{Figs/}}
\fi

\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][t]{%
  \oldtable[#1]
  \centering
  \footnotesize
}{%
  \endoldtable
}

\let\oldfigure\figure
\let\endoldfigure\endfigure
\renewenvironment{figure}[1][t]{%
  \oldfigure[#1]
  \centering
  \footnotesize
}{%
  \endoldfigure
}

% ******************************* Time Stamp ***********************************
% Compute the timestamp based on an idea of
% Tim Piessens \texttt{<Tim.Piessens@esat.kuleuven.ac.be>}.

\RequirePackage{datetime}

\newcount\PHD@hour \newcount\PHD@minute
\PHD@hour=\time
\divide \PHD@hour by 60
\PHD@minute=\time
\count@=\PHD@hour
\multiply \count@ by -60
\advance \PHD@minute by \count@
\newcommand{\PHD@daytime}{%
  \today\space--\space%
  \ifnum\PHD@hour=0 00\else\ifnum\PHD@hour<10 0\fi%
  \number\PHD@hour\fi:\ifnum\PHD@minute<10 0\fi\number\PHD@minute
}

% Line numbering (can be switched off)
\RequirePackage[switch,pagewise,mathlines]{lineno}
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \nolinenumbers
}
\renewcommand{\mainmatter}{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \nolinenumbers
}
\renewcommand{\backmatter}{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \nolinenumbers
}

% ********************************** Fonts **********************************
\RequirePackage{textcomp}
% Font Selection
\ifPHD@times
  \ifxetex
  \else
    \RequirePackage{lmodern}  % Get scalable typewriter font
    \RequirePackage{mathptmx}  % times roman, including math (where possible)
  \fi
  \setFonttrue
  \message{MasterThesisPSnPDF: Using Times Roman font}
\else
  \ifPHD@fourier
    \RequirePackage{fourier} % Fourier
    \setFonttrue
    \message{MasterThesisPSnPDF: Using Fourier font}
  % \else
  %   \ifsetCustomFont
  %     \setFonttrue
  %     \message{MasterThesisPSnPDF: Using custom font}
    \else
      \setFontfalse
      \message{MasterThesisPSnPDF: No font is set}
    % \fi % custom font
  \fi % Fourier font
\fi % Times font

% If Font is not set throw a warning.
\ifsetFont
\else
  \ClassWarning{MasterThesisPSnPDF}{Using default font Latin Modern. If you
    would like to use other pre-defined fonts use `times' (The Cambridge 
    University PhD thesis guidelines recommend using Times font)  or `fourier'
    or load a custom font in the preamble.tex file by specifying `customfont' 
    in the class options}
  \RequirePackage{lmodern}
\fi


\ifxetex
  % XeLaTeX
  \usepackage{amsmath}
  \usepackage{fontspec}
  \usepackage[]{unicode-math}
  \setmainfont[
    Extension = .otf,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]{XITS}
  
  \setmathfont[ 
    Extension = .otf,
    BoldFont = XITSMath-Bold,
  ]{XITSMath-Regular}
  
\else
  % default: pdfLaTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  
  % If building with PDFLaTeX, use microtype spacing adjustments
  \RequirePackage[final]{microtype}
  
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfglyphtounicode{f_l}{FB02}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfgentounicode=1

  \RequirePackage{amsfonts}
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
\fi

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\RequirePackage[unicode=true,pdfa]{hyperref}

% For PDF Online version
\hypersetup{
final=true,
plainpages=false,
pdfstartview=FitV,
pdftoolbar=true,
pdfmenubar=true,
bookmarksopen=true,
bookmarksnumbered=true,
breaklinks=true,
linktocpage,
colorlinks=true,
linkcolor=blue,
urlcolor=blue,
citecolor=blue,
anchorcolor=green
}

\ifsetCustomMargin
% Margin to be define in preamble using geometry package
\else
  % No Margin staggering on Odd and Even side
  \RequirePackage[paper=\PHD@papersize,hmarginratio=1:1,
    vmarginratio=1:1,scale=0.75]{geometry} % dvips
\fi
\hypersetup{pdfpagelayout=OneColumn}


% ************************ URL Package and Definition **************************
\RequirePackage{url}
% Redefining urlstyle to use regular font
\newcommand{\url@leostyle}{\renewcommand{\UrlFont}{\rmfamily}}
\urlstyle{leo}

% option to split urls over multiple lines for latex >> DVIPS >> PDF option
\ifpdf
  % PDFLaTeX does it automatically.
\else
  % dvips
  \ifxetex
  \else % If not XeLaTeX
    \RequirePackage{breakurl} % to split the url over multiple lines
  \fi
\fi
  
% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************

% *************************** Setting PDF Meta-Data ****************************
\ifpdf
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords}
  }
}
\fi

% ******************************** Line Spacing ********************************
% Set spacing as 1.5 line spacing for the PhD Thesis
% In practice, fortunately, nobody knows really what “one-and-a-half spaced
% type” means exactly (in terms of millimetres baseline distance). The following
% LaTeX setting has routinely been considered perfectly acceptable:

\renewcommand\baselinestretch{1.2}

% ******************************** Justification *******************************
% Left aligned as per University identity guidelines
\ifPHD@textJustify
\message{MasterThesisPSnPDF: The University identity guidelines recommend using 
left aligned text. Please use `flushleft' in the documentclass option, if you
wish to left align your text}
\else
\AtBeginDocument{
\raggedright
}
\fi


% ************************** TOC and Hide Sections *****************************
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{
	\bgroup\let
	\addcontentsline=\nocontentsline#1{#2}
	\egroup}
% Removes pagenumber appearing from TOC
\addtocontents{toc}{\protect\thispagestyle{empty}}


% ***************************** Header Formatting ******************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

% Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
\fancypagestyle{PageStyleI}{
  \renewcommand{\chaptermark}[1]{\markboth{##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1\ }}
  \fancyhf{}
  \fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | 
    \hspace{0.25em} \bfseries{\thepage}}
  \fancyhead[LE]{ {\bfseries\thepage} \hspace{0.25em} | 
    \hspace{0.25em} \nouppercase \leftmark}
}

% Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
\fancypagestyle{PageStyleII}{
  \renewcommand{\chaptermark}[1]{\markboth{##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \fancyhead[RO]{\bfseries\nouppercase \rightmark}
  \fancyhead[LE]{\bfseries \nouppercase \leftmark}
  \fancyfoot[C]{\thepage}
}


% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\newcommand{\setFancyHdr}{

\pagestyle{fancy}

\ifPHD@pageStyleI
  % Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
  \pagestyle{PageStyleI}

\else
  \ifPHD@pageStyleII

  % Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
  \pagestyle{PageStyleII}

  \else
  % Default Style: Sets Page Number at the Top (LE/RO) with Chapter/Section Name
  % on LO/RE and an empty footer
    \renewcommand{\chaptermark}[1]{\markboth {##1}{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
    \fancyhf{}
    \fancyhead[LO]{\nouppercase \rightmark}
    \fancyhead[LE,RO]{\bfseries\thepage}
    \fancyhead[RE]{\nouppercase \leftmark}
  \fi
\fi
}

\setlength{\headheight}{14.5pt}
%\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

% If Margin has been set (default margin print/online version)
\ifsetCustomMargin
\AtBeginDocument{
\@ifpackageloaded{geometry}{}{\ClassWarning{MasterThesisPSnPDF}{%
  Custom margin is chosen, but geometry package is not loaded. Please load the
  `geometry' package in the preamble.}}}
\else
%\setFancyHdr % Apply fancy header settings otherwise apply it in preamble
\fi

% **************** Clear Header Style on the Last Empty Odd pages **************
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Author origin
\newcommand{\@authororigin}{}
\newcommand{\authororigin}[1]{\renewcommand{\@authororigin}{#1}}

% Matriculation Number
\newcommand{\@matriculationNum}{}
\newcommand{\matriculationNum}[1]{\renewcommand{\@matriculationNum}{#1}}

% Subtitle (optional)
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

% The year and term the degree will be officially conferred
\newcommand{\@submissiondate}{\monthname[\the\month]\space\the\year}
\newcommand{\submissiondate}[1]{\renewcommand{\@submissiondate}{#1}}

% The full (unabbreviated) name of the degree
\newcommand{\@degreetitle}{}
\newcommand{\degreetitle}[1]{\renewcommand{\@degreetitle}{#1}}

% Supervisor
\newcommand{\supervisors}{}
% Command to add supervisors to the list
\newcommand{\supervisor}[1]{%
    \ifdefempty{\supervisors}{%
        \def\supervisors{\textbf{#1}}%
    }{%
        \appto\supervisors{

        and
        
        \textbf{#1}}%
    }%
}

% Dissertation number assigned by HSG
\newcommand{\@dissnumber}{}
\newcommand{\dissnumber}[1]{\renewcommand{\@dissnumber}{#1}}

% Producer
\newcommand{\@printery}{}
\newcommand{\printery}[1]{\renewcommand{\@printery}{#1}}

% keywords (These keywords will appear in the PDF meta-information
% called `pdfkeywords`.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% subjectline (This subject will appear in the PDF meta-information
% called `pdfsubject`.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

% Names for the nomenclature groups
\newcommand{\@nomenclatureromans}{Roman Symbols}
\newcommand{\@nomenclaturegreeks}{Greek Symbols}
\newcommand{\@nomenclatureacronyms}{Acronyms / Abbreviations}
\newcommand{\@nomenclaturesuperscripts}{Superscripts}
\newcommand{\@nomenclaturesubscripts}{Subscripts}
\newcommand{\@nomenclatureothers}{Other Symbols}


% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Set single column even under two column layout
\newcommand{\setsinglecolumn}{
\if@twocolumn
   \onecolumn
\else
\fi
}


% ******************************************************************************
% ********************************* Layout *************************************
% ******************************************************************************


%format{〈command 〉}[〈shape〉]{〈format〉}{〈label 〉}{〈sep〉}{〈before〉}[〈after 〉]
\RequirePackage[compact,largestsep]{titlesec}
\titleclass{\chapter}{straight}
\titleformat{\chapter}[display]
  {\normalfont\Large\bfseries}
  {\chaptertitlename\ \thechapter}{60pt}{\Huge\bfseries}

% \titleformat{\chapter}[hang]
%   {\fontsize{17pt}{17pt}\bfseries}{\thechapter}{0.8em}{}
% \titlespacing*{\chapter}{0mm}{0pt}{17pt}

\titleformat{name=\chapter,numberless}[hang]
  {\normalfont\Large\bfseries}{}{0pt}{}

% Enforce cleardoublepage before each chapter
\let\oldchapter\chapter
\renewcommand{\chapter}{%
  \cleardoublepage
  \thispagestyle{plain}
  \oldchapter
}

% Section
\titleformat{\section}[hang]
  {\fontsize{15pt}{0pt}\bfseries}{}{0pt}{\thesection\ \hspace{0.8em} \fontsize{15pt}{0pt}\bfseries}[]
\titlespacing*{\section}{0mm}{25pt plus 2pt minus 2pt}{5pt plus 2pt minus 2pt}

\titleformat{name=\section,numberless}[hang]
  {\fontsize{15pt}{0pt}\bfseries}{}{0pt}{\fontsize{15pt}{0pt}\bfseries}

% Subsection
\titleformat{\subsection}[hang]
  {\fontsize{14pt}{0pt}\bfseries}{}{0pt}{\thesubsection\ \hspace{0.8em} \fontsize{14pt}{0pt}\bfseries}[]
\titlespacing*{\subsection}{0mm}{22pt plus 2pt minus 2pt}{4pt plus 1pt minus 1pt}
 
% Subsubsection 
\titleformat{\subsubsection}[hang]
  {\fontsize{13pt}{0pt}\bfseries}{}{0pt}{\thesubsubsection\ \hspace{0.8em} \fontsize{13pt}{0pt}\bfseries}[]
\titlespacing*{\subsubsection}{0mm}{20pt plus 2pt minus 2pt}{2pt plus 1pt minus 1pt}

% Paragraph
\titleformat{\paragraph}[runin]{\bfseries}{\theparagraph}{}{}[]
% Use to start a plain, unnamed paragraph after named paragraphs
\newcommand\noparagraph{\medskip\noindent}

\newcommand{\prematter}{%
  \pagestyle{empty}
}

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{%
    \pagestyle{PageStyleII}
    \oldfrontmatter
}

% ******************************** Title Page **********************************
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \begin{singlespace}
  \begin{center}
  \begin{spacing}{1.3} 

  \phantom{.}

  \includegraphics[scale=1]{graphics/logo.png}
  \vfill
  
  {\Huge University of St. Gallen}

  School of Computer Science

  to obtain the title of
  
  \@degreetitle

  \vfill
  \vfill
  \vfill
  % horizontal line
  \hrulefill
  \begin{spacing}{1}
    \small
    {
      Master Thesis on
      \vspace{4mm}
      
    }
    \LARGE
    {
      \@title
      \vspace{2mm}
    }%
    \ifthenelse{\equal{\@subtitle}{}}{
      % subtitle is not defined
    }
    \large
    {
      \\{\@subtitle}
    }% subtitle is defined
  \end{spacing}
  % horizontal line
  \hrulefill
  
  \vfill
  Submitted by:
  
  \textbf{\@author}
  
  \@matriculationNum
  
  \vfill
  
  Approved on the application by:
  
  \supervisors

  \vfill

  Date of Submission:

  \@submissiondate
  
  \end{spacing}
  \end{center}
  \end{singlespace}
}


% ******************************* Nomenclature *********************************
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nomgroup}[1]{%
\ifthenelse{\equal{#1}{A}}{\item[\textbf{\@nomenclatureromans}]}{% 
\ifthenelse{\equal{#1}{G}}{\item[\textbf{\@nomenclaturegreeks}]}{%
\ifthenelse{\equal{#1}{Z}}{\item[\textbf{\@nomenclatureacronyms}]}{%
\ifthenelse{\equal{#1}{R}}{\item[\textbf{\@nomenclaturesuperscripts}]}{%
\ifthenelse{\equal{#1}{S}}{\item[\textbf{\@nomenclaturesubscripts}]}{%
\ifthenelse{\equal{#1}{X}}{\item[\textbf{\@nomenclatureothers}]}
{}
}% matches mathematical symbols > X
}% matches Subscripts           > S
}% matches Superscripts         > R
}% matches Abbreviations        > Z
}% matches Greek Symbols        > G
}% matches Roman Symbols        > A

% To add nomenclature in the header
\renewcommand{\nompreamble}{\markboth{\nomname}{\nomname}}

% Add nomenclature to contents and print out nomenclature
\newcommand{\printnomencl}[1][]{
\ifthenelse{\equal {#1}{}}
{\printnomenclature}
{\printnomenclature[#1]}
% \addcontentsline{toc}{chapter}{\nomname}
}


% ***************************** Create the index *******************************

\newcommand{\printthesisindex}{}