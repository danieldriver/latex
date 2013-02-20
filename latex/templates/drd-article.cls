%%
%% This is the file `drd-article.cls', a LaTeX document class adapted by D.R. Driver.
%% Some of his work is online at <www.danieldriver.com> and <www.github.com/danieldriver>.
%%
%% The class builds on the standard article class but aims to provide better typographic
%% defaults. It is for personal use and presupposes the presence of proprietary fonts.  
%% The source file `article.cls' was drawn from the 2012 LaTeX distribution base, here:
%%   /usr/local/texlive/2012/texmf-dist/tex/latex/base/
%%
%% Comments refer to the following sources by abbreviation:
%% 	 - clsguide: "LATEX2𝜀 for class and package writers," 15 February 2006. From the terminal type `texdoc clsguide` to pull it up.
%% 	 - Companion2: Frank Mittelbach et al. *The LaTeX Companion.* 2nd edition. Boston: Addison-Wesley, 2004.
%%   - Flynn: Peter Flynn, "Rolling your own Document Class," TUGboat 28/1 (2007): 110--123. <www.tug.org/TUGboat/tb28-1/tb88flynn.pdf>
%% 	 - Guide4: Helmut Kopka and Patrick W. Daly. *Guide to LaTeX.* 4th edition. Boston: Addison-Wesley, 2004.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{drd-article}
              [2012/02/20 v0.1b
               DRD's custom article class]
% Default values
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
% Paper size options
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{octavo}
   {\setlength\paperheight {9in}%
    \setlength\paperwidth  {6in}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
% Type size and layout options
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
% Apply options
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}% Defaults
\ProcessOptions
%
%% Type size (Flynn 2.4.1.1) %%
%
\RequirePackage{fontspec,realscripts}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont[Numbers=OldStyle]{Arno Pro}
\setsansfont[ItalicFont={SeriaSansPro-BoldItalic}]{SeriaSansPro-Italic}
\setsansfont{Seria Sans Pro}
\setmonofont{Menlo}
\newfontfamily{\sbl}{SBL Hebrew}
\newfontfamily{\display}[Alternate=1,Style=TitlingCaps]{SilentiumPro-RomanI}
\frenchspacing
%
\RequirePackage{ifthen}% Guide4 10.3.5 (p192)
\ifthenelse{\@ptsize = 0}{% 10pt base size
  \newcommand{\tiny}{\fontsize{6}{9}\selectfont}
  \newcommand{\scriptsize}{\fontsize{7}{10}\selectfont}
  \newcommand{\footnotesize}{\fontsize{8}{11}\selectfont%
			  \abovedisplayskip 8\p@ \@plus3\p@ \@minus4\p@
			  \abovedisplayshortskip \z@ \@plus\p@
			  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
			  \def\@listi{\leftmargin\leftmargini
						  \topsep 3\p@ \@plus\p@ \@minus\p@
						  \parsep 2\p@ \@plus\p@ \@minus\p@
						  \itemsep \parsep}%
			  \belowdisplayskip \abovedisplayskip}
  \newcommand{\small}{\fontsize{9}{12}\selectfont%
			  \abovedisplayskip 9\p@ \@plus3\p@ \@minus4\p@
			  \abovedisplayshortskip \z@ \@plus2\p@
			  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
			  \def\@listi{\leftmargin\leftmargini
						  \topsep 4\p@ \@plus2\p@ \@minus2\p@
						  \parsep 2\p@ \@plus\p@ \@minus\p@
						  \itemsep \parsep}%
			  \belowdisplayskip \abovedisplayskip}
\renewcommand{\normalsize}{\fontsize{10}{13}\selectfont%
			  \abovedisplayskip 10\p@ \@plus3\p@ \@minus5\p@
			  \abovedisplayshortskip \z@ \@plus3\p@
			  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
			  \belowdisplayskip \abovedisplayskip
			  \let\@listi\@listI}
  \newcommand{\large}{\fontsize{12}{15}\selectfont}
  \newcommand{\Large}{\fontsize{14}{16}\selectfont}
  \newcommand{\LARGE}{\fontsize{16}{20}\selectfont}
  \newcommand{\huge}{\fontsize{18}{20}\selectfont}
  \newcommand{\Huge}{\fontsize{21}{23}\selectfont}
  \newcommand{\HUGE}{\fontsize{24}{26}\selectfont}
}{}
\ifthenelse{\@ptsize = 1}{% 11pt base size
  \newcommand{\tiny}{\fontsize{7}{10}\selectfont}
  \newcommand{\scriptsize}{\fontsize{8}{11}\selectfont}
  \newcommand{\footnotesize}{\fontsize{9}{12}\selectfont%
			  \abovedisplayskip 9\p@ \@plus3\p@ \@minus4\p@
			  \abovedisplayshortskip \z@ \@plus2\p@
			  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
			  \def\@listi{\leftmargin\leftmargini
						  \topsep 4\p@ \@plus2\p@ \@minus2\p@
						  \parsep 2\p@ \@plus\p@ \@minus\p@
						  \itemsep \parsep}%
			  \belowdisplayskip \abovedisplayskip}
  \newcommand{\small}{\fontsize{10}{13}\selectfont%
			  \abovedisplayskip 10\p@ \@plus3\p@ \@minus5\p@
			  \abovedisplayshortskip \z@ \@plus3\p@
			  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
			  \def\@listi{\leftmargin\leftmargini
						  \topsep 6\p@ \@plus2\p@ \@minus2\p@
						  \parsep 3\p@ \@plus2\p@ \@minus\p@
						  \itemsep \parsep}%
			  \belowdisplayskip \abovedisplayskip}
\renewcommand{\normalsize}{\fontsize{11}{14}\selectfont%
			  \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
			  \abovedisplayshortskip \z@ \@plus3\p@
			  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
			  \belowdisplayskip \abovedisplayskip
			  \let\@listi\@listI}
  \newcommand{\large}{\fontsize{14}{16}\selectfont}
  \newcommand{\Large}{\fontsize{16}{18}\selectfont}
  \newcommand{\LARGE}{\fontsize{18}{20}\selectfont}
  \newcommand{\huge}{\fontsize{21}{23}\selectfont}
  \newcommand{\Huge}{\fontsize{24}{26}\selectfont}
  \newcommand{\HUGE}{\fontsize{30}{32}\selectfont}
}{}
\ifthenelse{\@ptsize = 2}{% 12pt base size
  \newcommand{\tiny}{\fontsize{8}{11}\selectfont}
  \newcommand{\scriptsize}{\fontsize{9}{12}\selectfont}
  \newcommand{\footnotesize}{\fontsize{10}{13}\selectfont%
			  \abovedisplayskip 10\p@ \@plus3\p@ \@minus5\p@
			  \abovedisplayshortskip \z@ \@plus3\p@
			  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
			  \def\@listi{\leftmargin\leftmargini
						  \topsep 6\p@ \@plus2\p@ \@minus2\p@
						  \parsep 3\p@ \@plus2\p@ \@minus\p@
						  \itemsep \parsep}%
			  \belowdisplayskip \abovedisplayskip}
  \newcommand{\small}{\fontsize{11}{14}\selectfont%
			  \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
			  \abovedisplayshortskip \z@ \@plus3\p@
			  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
			  \def\@listi{\leftmargin\leftmargini
						  \topsep 9\p@ \@plus3\p@ \@minus5\p@
						  \parsep 4.5\p@ \@plus2\p@ \@minus\p@
						  \itemsep \parsep}%
			  \belowdisplayskip \abovedisplayskip}
\renewcommand{\normalsize}{\fontsize{12}{14}\selectfont%
			  \abovedisplayskip 12\p@ \@plus2\p@ \@minus7\p@
			  \abovedisplayshortskip \z@ \@plus3\p@
			  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
			  \belowdisplayskip \abovedisplayskip
			  \let\@listi\@listI}
  \newcommand{\large}{\fontsize{16}{18}\selectfont}
  \newcommand{\Large}{\fontsize{18}{20}\selectfont}
  \newcommand{\LARGE}{\fontsize{21}{23}\selectfont}
  \newcommand{\huge}{\fontsize{24}{26}\selectfont}
  \newcommand{\Huge}{\fontsize{30}{32}\selectfont}
  \newcommand{\HUGE}{\fontsize{36}{38}\selectfont}
}{}
\normalsize % required for subsequent calculations
\if@twocolumn
  \setlength\parindent{1em}
\else
  \ifthenelse{\@ptsize = 0}{\setlength\parindent{13\p@}}{\setlength\parindent{14\p@}}
\fi
%
%% Spacing (Flynn 2.4.1.2) %%
% TK - adjust these per font size selection
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {25\p@}
\setlength\topskip   {1\@ptsize\p@}
\setlength\footskip{30\p@}
\setlength\maxdepth{.5\topskip}
%
%% Text area (Flynn 2.4.1.3) %%
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-2in}
%\setlength\@tempdimb{345\p@}% originally 360 for 11pt, 390 for 12pt
\settowidth\@tempdimb{\normalfont abcdefghijklmnopqrstuvwxyz}
\if@twocolumn
  \ifdim\@tempdima>2\@tempdimb\relax
	\setlength\textwidth{2\@tempdimb}
  \else
	\setlength\textwidth{\@tempdima}
  \fi
\else
  \ifdim\@tempdima>\@tempdimb\relax
	\setlength\textwidth{2.5\@tempdimb}% about the same as 66, and simpler: tex.stackexchange.com/questions/59626
  \else
	\setlength\textwidth{\@tempdima}
  \fi
\fi
\@settopoint\textwidth
\setlength\@tempdima{\paperheight}
\addtolength\@tempdima{-2in}
\addtolength\@tempdima{-1.5in}
\divide\@tempdima\baselineskip
\@tempcnta=\@tempdima
\setlength\textheight{\@tempcnta\baselineskip}
\addtolength\textheight{\topskip}
%
%% Page margins (Flynn 2.4.1.4) %%
\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{10\p@}
\fi
\ifthenelse{\@ptsize = 2}{\setlength\marginparpush{7\p@}}{\setlength\marginparpush{5\p@}}
\if@twoside
  \setlength\@tempdima        {\paperwidth}
  \addtolength\@tempdima      {-\textwidth}
  \setlength\oddsidemargin    {.4\@tempdima}
  \addtolength\oddsidemargin  {-1in}
  \setlength\marginparwidth   {.6\@tempdima}
  \addtolength\marginparwidth {-\marginparsep}
  \addtolength\marginparwidth {-0.4in}
\else
  \setlength\@tempdima        {\paperwidth}
  \addtolength\@tempdima      {-\textwidth}
  \setlength\oddsidemargin    {.5\@tempdima}
  \addtolength\oddsidemargin  {-1in}
  \setlength\marginparwidth   {.5\@tempdima}
  \addtolength\marginparwidth {-\marginparsep}
  \addtolength\marginparwidth {-0.4in}
  \addtolength\marginparwidth {-.4in}
\fi
\ifdim \marginparwidth >2in
   \setlength\marginparwidth{2in}
\fi
\@settopoint\oddsidemargin
\@settopoint\marginparwidth
\setlength\evensidemargin  {\paperwidth}
\addtolength\evensidemargin{-2in}
\addtolength\evensidemargin{-\textwidth}
\addtolength\evensidemargin{-\oddsidemargin}
\@settopoint\evensidemargin
\setlength\topmargin{\paperheight}
\addtolength\topmargin{-2in}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}
\addtolength\topmargin{-\textheight}
\addtolength\topmargin{-\footskip}     % this might be wrong!
\addtolength\topmargin{-.5\topmargin}
\@settopoint\topmargin
%
%% Footnote space (Flynn 2.4.1.5) %%
\ifthenelse{\@ptsize = 0}{\setlength\footnotesep{6.65\p@}}{}
\ifthenelse{\@ptsize = 1}{\setlength\footnotesep{7.7\p@}}{}
\ifthenelse{\@ptsize = 2}{\setlength\footnotesep{8.4\p@}}{}
\setlength{\skip\footins}{1\@ptsize\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep      {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep  {20\p@ \@plus 2\p@ \@minus 4\p@}
\ifthenelse{\@ptsize = 2}
  {\setlength\intextsep  {14\p@ \@plus 2\p@ \@minus 4\p@}}
  {\setlength\intextsep  {12\p@ \@plus 2\p@ \@minus 2\p@}}
\ifthenelse{\@ptsize = 2}
  {\setlength\dblfloatsep{14\p@ \@plus 2\p@ \@minus 4\p@}}
  {\setlength\dblfloatsep{12\p@ \@plus 2\p@ \@minus 2\p@}}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\ifthenelse{\@ptsize = 2}
  {\setlength\@fpsep{10\p@ \@plus 2fil}}
  {\setlength\@fpsep{8\p@ \@plus 2fil}}
   \setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\ifthenelse{\@ptsize = 2}
  {\setlength\@dblfpsep{10\p@ \@plus 2fil}}
  {\setlength\@dblfpsep{8\p@ \@plus 2fil}}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{3\p@ \@plus 2\p@ \@minus 2\p@}
%
%% Lists (Flynn 2.4.1.6) %%
\def\@listi{\leftmargin\leftmargini%
			\ifthenelse{\@ptsize = 0}{
			   \parsep 4\p@ \@plus2\p@ \@minus\p@
			   \topsep 8\p@ \@plus2\p@ \@minus4\p@
			   \itemsep4\p@ \@plus2\p@ \@minus\p@}{}
			\ifthenelse{\@ptsize = 1}{
			   \parsep 4.5\p@ \@plus2\p@ \@minus\p@
			   \topsep 9\p@   \@plus3\p@ \@minus5\p@
			   \itemsep4.5\p@ \@plus2\p@ \@minus\p@}{}
			\ifthenelse{\@ptsize = 2}{
			   \parsep 5\p@  \@plus2.5\p@ \@minus\p@
			   \topsep 10\p@ \@plus4\p@   \@minus6\p@
			   \itemsep5\p@  \@plus2.5\p@ \@minus\p@}{}
		    }
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
			 \labelwidth\leftmarginii
			 \advance\labelwidth-\labelsep
			 \ifthenelse{\@ptsize = 2}
				{\topsep   5\p@ \@plus2.5\p@ \@minus\p@
				 \parsep 2.5\p@ \@plus\p@    \@minus\p@}
				{\topsep   4\p@ \@plus2\p@   \@minus\p@
				 \parsep   2\p@ \@plus\p@    \@minus\p@}
			 \itemsep   \parsep
			 }


\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
			  \ifthenelse{\@ptsize = 2}
				 {\topsep 3\p@ \@plus\p@ \@minus2\p@}
				 {\topsep 2\p@ \@plus\p@ \@minus\p@}
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
% End input based on standard LaTeX distribution of `size10.clo'
%
%% Paragraph spacing and penalties (Flynn 2.4.1, 2.4.2) %%
\setlength\lineskip{1\p@} % makes negative leading impossible
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
%
%% Running heads (Flynn 2.4.3) %%
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
%
%% Titling (Flynn 2.4.4) %%
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
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
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
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
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
%
%% Structure (Flynn 2.5) %%
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
%
%% Indents and margins (Flynn 2.6) %%
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
%
%% Abstract (Flynn 2.7) %%
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation\noindent\ignorespaces % remove initial par indent, with Flynn 2.7
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
%
%% Quotation environments (Flynn 2.8) %%
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \z@ % remove initial par indent, with Flynn 2.8
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
  {%
	\if@twocolumn
	  \@restonecoltrue\onecolumn
	\else
	  \@restonecolfalse\newpage
	\fi
	\thispagestyle{empty}%
	\setcounter{page}\@ne
  }%
  {\if@restonecol\twocolumn \else \newpage \fi
   \if@twoside\else
	  \setcounter{page}\@ne
   \fi
  }
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
%
%% Figures and tables (Flynn 2.9) %%
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%
%% Legacy support (Flynn 2.10) %%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
%
%% Table of contents (Flynn 2.11) %%
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
%
%% Bibliography and indent (Flynn 2.12) %%
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
%
%% Footnote rule, section name, date format, etc. (Flynn 2.13) %%
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\number\day\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput
%%
%% End of file `drd-article.cls'.
