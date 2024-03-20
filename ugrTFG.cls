\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugrTFG}[2023/06/15 Clase de documento para TFG] %elaboraci\'on TFG en Matem\'aticas seg\'un normativa de la Universidad de Granada]

% IMAGEN PARA LA PORTADA
% Existen varias opciones para la imagen de fondo de la portada del TFG. Todas ellas tienen en logotipo de la universidad de Granada en la cabecera. Las opciones son las siguientes:
% 1. portada-ugr y portada-ugr-color: diseño con marca de agua basada en el logo de la UGR (en escala de grises y color).
% 2. portada-ugr-sencilla y portada-ugr-sencilla-color: portada únicamente con el logotipo de la UGR en la cabecera.
\newcommand{\archivoportada}{portada-ugr}


% ===================================================================
% OPCIONES DE LA CLASE
% ===================================================================

% PRINT
\DeclareOption{print}{
  \PassOptionsToClass{fontsize=10pt, paper=a4, twoside=true, BCOR=5mm, DIV=10}{scrbook}
}

% TABLET
\DeclareOption{tablet}{
  \PassOptionsToClass{fontsize=12pt, paper=19.7104cm:14.7828cm, twoside=false, BCOR=0cm, DIV=20}{scrbook}
% Para que la portada quede centrada correctamente hay que editar el
% archivo `portada.tex` y eliminar el entorno `addmargin`
}

\DeclareOption{color}{
  \renewcommand{\archivoportada}{portada-ugr-color}
  % \PassOptionsToPackage[colorlinks = true, linkcolor = [rgb]{0.5, 0, 0}, urlcolor = [rgb]{0, 0, 0.5}, citecolor = [rgb]{0, 0.5, 0}, ]{hyperref}
}
\ProcessOptions\relax

\LoadClass[headings=normal, headsepline=false, cleardoublepage=empty, chapterprefix=false, appendixprefix=false,	listof=totoc, index=totoc, bibliography=totoc]{scrbook}


% -------------------------------------------------------------------
% PAQUETES Y OPCIONES
% -------------------------------------------------------------------
\RequirePackage[utf8]{inputenc} 

\RequirePackage[english, spanish, es-nodecimaldot, es-noindentfirst, es-tabla,es-noquoting]{babel}
  \unaccentedoperators % Desactiva los acentos en los operadores matemáticso (p.e. \lim, \max, ...). Eliminar esta opción si queremos que vayan acentuados

\RequirePackage{amsmath}
\RequirePackage{amsthm} 
\RequirePackage{amssymb} 
\RequirePackage{mathtools}
%   % Sólo se numeran las ecuaciones que se usan
  \mathtoolsset{showonlyrefs=true}      
\RequirePackage[mathscr]{eucal} 		  % Proporciona el comando 
%                                       % \mathscr para fuentes de
%                                       % tipo manuscrito en modo 
%                                       % matemático sin sobreescribir 
%                                       % el comando \mathcal

% Teoremas y entornos asociados

  \newtheorem*{teorema*}{Teorema}
  \newtheorem{teorema}{Teorema}[chapter]
  \newtheorem{proposicion}{Proposición}[chapter]
  \newtheorem{lema}{Lema}[chapter]
  \newtheorem{corolario}{Corolario}[chapter]

  \theoremstyle{definition}
  \newtheorem{definicion}{Definición}[chapter]
  \newtheorem{ejemplo}{Ejemplo}[chapter]

  \theoremstyle{remark}
  \newtheorem{observacion}{Observación}[chapter]

\RequirePackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype}

% Las tipografías elegidas para el documento, siguiendo la guía de estilo de la UGR, son las siguientes
% Normal font: 			URW Palladio typeface. 
% Sans-serif font: 	Gill Sans (paquete cabin)
% Monospace font: 	Inconsolata
\RequirePackage[T1]{fontenc}
\RequirePackage[sc, osf]{mathpazo} \linespread{1.05}         
\IfFileExists{cabin.sty}{
  \RequirePackage[scaled=.95,type1]{cabin} 
} %else
{
  % Si cabin da ERROR usar el siguiente comando en su lugar
  \renewcommand{\sfdefault}{iwona} 
}
\RequirePackage{inconsolata}

\RequirePackage{setspace}
\RequirePackage{xspace} % Para problemas de espaciado al definir comandos

\RequirePackage{xurl}

\RequirePackage{hyperref}

\hypersetup{%
  % hidelinks,            % Enlaces sin color ni borde. El borde no se imprime
  linkbordercolor=0.8 0 0,
  citebordercolor=0 0.8 0,
  citebordercolor=0 0.8 0,
  colorlinks = true,            % Color en texto de los enlaces. Comentar esta línea o cambiar `true` por `false` para imprimir el documento.
  linkcolor = [rgb]{0.5, 0, 0}, % Color de los enlaces internos
  urlcolor = [rgb]{0, 0, 0.5},  % Color de los hipervínculos
  citecolor = [rgb]{0, 0.5, 0}, % Color de las referencias bibliográficas
  pdfsubject={Trabajo de fin de Grado},%
	pdfkeywords={},%
	pdfcreator={pdfLaTeX},%
}

% Etiquetas en español para el comando \autoref
\def\chapterautorefname{Capítulo}
\def\appendixautorefname{Apéndice}
\def\sectionautorefname{Sección}
\def\subsectionautorefname{Subsección}
\def\figureautorefname{Fig.}
\def\tableautorefname{Tabla}
\def\listingnameautorefname{Código}

\def\teoremaautorefname{Teorema}
\def\proposicionautorefname{Proposición}
\def\lemaautorefname{Lema}
\def\corolarioautorefname{Corolario}
\def\definicionautorefname{Def.}
\def\observacionautorefname{Observación}
\def\ejemploautorefname{E.j.}

% Pone automáticamente un paréntesis para las ecuaciones
\def\equationautorefname~#1\null{(#1)\null}

% -------------------------------------------------------------------
% TABLAS, GRÁFICOS Y LISTADOS DE CÓDIGO
% -------------------------------------------------------------------
\RequirePackage{booktabs}
% \renewcommand{\arraystretch}{1.5} % Aumenta el espacio vertical entre las filas de un entorno tabular

\RequirePackage{xcolor} 
\RequirePackage{graphicx}
  % Carpeta donde buscar los archivos de imagen por defecto
  \graphicspath{{img/}}


% -------------------------------------------------------------------
% Código
% -------------------------------------------------------------------
\RequirePackage{listings}
\renewcommand{\lstlistingname}{Código}

% Comandos auxiliares
\newcommand{\ContinueLineNumber}{\lstset{firstnumber=last}}
\newcommand{\StartLineAt}[1]{\lstset{firstnumber=#1}}
\newcommand{\numberLineAt}[1]{\StartLineAt{#1}}

% Colores
% El siguiente estilo copia el existente en Jupyter
\definecolor{background}{rgb}{0.97, 0.97, 0.97}     % Gris
\definecolor{keyword}{rgb}{0.22, 0.5, 0}            % Verde
\definecolor{identifier}{rgb}{0,0,0}                % Negro
\definecolor{string}{rgb}{0.75, 0.13, 0.13}         % Rojo
\definecolor{comment}{gray}{0.6}
% \definecolor{comment}{rgb}{0.75, 0.13, 0.13}
\definecolor{number}{rgb}{0.4,0.4,0.4}
\definecolor{command}{rgb}{0,0,0.5}
\definecolor{parameter}{rgb}{0.28,0.14,0.45}
\definecolor{operator}{rgb}{0.67, 0.13, 1}
\definecolor{output}{rgb}{0.03,0.4,0.03}

\lstdefinestyle{ugr}{ %
  float=hbp,
  frame=single, % none, leftline, topline, bottomline, lines, single, shadowbox
  rulecolor=\color[rgb]{0.81, 0.81, 0.81}, % Color of frame
  %aboveskip=3mm,                      % espacio superior
  %belowskip=3mm,                      % espacio inferior
  numbers=left,                       % none, right (números de línea)
  numberstyle=\scriptsize\sffamily\color{number},
  numberfirstline=true,
  numbersep=1em,
  % xleftmargin=1em,
  xleftmargin=\parindent,             % nº en margen izquierdo
  firstnumber=last,                   % continua la numeración
  stepnumber=1,                       % muestra los números en todas las líneas
  % backgroundcolor=\color{background}, % color de fondo
  breaklines=true,                    % salto de línea en espacios
  captionpos=b,                       % Título en la parte inferior
  basicstyle={\small\ttfamily},       % Estilo base
  commentstyle=\color{comment},       % Estilo de los comentarios
  keywordstyle=\color{keyword}\bfseries,  % Estilo palabras clave
  stringstyle=\color{string}\itshape, % Estilo cadena de caracteres
  identifierstyle=\color{identifier}, % Estilo identificadores
  escapeinside={|}{|},           % Para usar código LaTeX
  showstringspaces=false,             % No mostrar espacios en blanco
  tabsize=2,                          % Tamaño del tabulador
  % Comandos de sagemath
  emphstyle=[1]\color{command}\bfseries,
  literate= 
  % Para que funcionen las tildes en el código
  {á}{{\'a}}1
  {é}{{\'e}}1
  {í}{{\'i}}1
  {ó}{{\'o}}1
  {ú}{{\'u}}1
  {Á}{{\'A}}1
  {É}{{\'E}}1
  {Í}{{\'I}}1
  {Ó}{{\'O}}1
  {Ú}{{\'U}}1
  {ñ}{{\~n}}1
  {Ñ}{{\~N}}1
  % http://tex.stackexchange.com/questions/17739/listings-package-how-to-highlight-math-operators
  % {+}{{{\color{operator}+}}}1
  % {-}{{{\color{operator}-}}}1
  % {*}{{{\color{operator}*}}}1
  % {/}{{{\color{operator}/}}}1
  % {=}{{{\color{operator}=}}}1
  % {>=}{{{\color{operator}>=}}}1
  % {<=}{{{\color{operator}<=}}}1
  % {==}{{{\color{operator}==}}}1
  % {!=}{{{\color{operator}!=}}}1
  % {@}{{{\color{operator}@}}}1
}

\lstset{style=ugr}
% -------------------------------------------------------------------
% ESTILOS DE LA CLASE KOMA
% -------------------------------------------------------------------
% Selecciona el tipo de fuente para los títulos (capítulo, sección, subsección) del documento.
\setkomafont{disposition}{\sffamily\bfseries}

% Cambia el ancho de la cita. Al inicio de un capítulo podemos usar el comando \dictum[autor]{cita} para añadir una cita famosa de un autor.
\renewcommand{\dictumwidth}{0.45\textwidth} 

\recalctypearea % Necesario tras definir la tipografía a usar.

% -------------------------------------------------------------------
% PORTADA Y PÁGINA DE TÍTULO
% -------------------------------------------------------------------

% Definición de la imagen de fondo (ver comando \archivoportada).
\RequirePackage{eso-pic}
  \newcommand\BackgroundPic{%
    \put(0,0){%
      \parbox[b][\paperheight]{\paperwidth}{%
        \vfill
        \centering
        % Indicar la imagen de fondo en el siguiente comando
        \includegraphics[width=\paperwidth,height=\paperheight,%
        keepaspectratio]{\archivoportada}%
        \vfill
  }}}

  \renewcommand{\maketitle}{
    \begin{titlepage}
      \AddToShipoutPicture*{\BackgroundPic}
      \phantomsection 
      \pdfbookmark[1]{Título}{title}

      % Para que el título esté centrado en la página.
      % Los valores numéricos deberán elegirse de acuerdo con el diseño de página (sobre todo si se cambia la opción BCOR o DIV).
      \begin{addmargin}[2.575cm]{0cm}
        \begin{flushleft}
          \Large  
          \hfill\vfil

          \large{\textsf{\miFacultad}}
          \vfill

          {\large\textsc\miGrado} \vfill


          {\large\textsc{trabajo de fin de grado}}

          \begin{flushleft}
            \Huge
            \setstretch{0.8}
            \miTitulo
          \end{flushleft}

          \vfill\vfill\vfill\vfill

          \textsf{\normalsize{Presentado por:}}\\
          {\normalsize\textrm{\miNombre}} 
          \bigskip

          \textsf{\normalsize{Curso académico \miCurso}}
        \end{flushleft}  
      \end{addmargin}       

    \end{titlepage}   
    \cleardoublepage

    \thispagestyle{empty}

    \begin{center}
      \large  

      \vspace*{\stretch{1}}

      \begingroup
      \huge{\miTitulo} \\ \bigskip
      \endgroup

      \textrm{\miNombre}

      \vspace{\stretch{5}}

    \end{center}  

    \newpage
    \thispagestyle{empty}

    \hfill

    \vfill

    \miNombre \textit{\miTitulo}.

    Trabajo de fin de Grado. Curso académico \miCurso.
    \bigskip

    \begin{minipage}[t]{0.25\textwidth}
      \flushleft
      \textbf{Responsable de tutorización}
    \end{minipage}
    \begin{minipage}[t]{0.45\textwidth}
      \flushleft
      \miTutor
    \end{minipage}
    \begin{minipage}[t]{0.30\textwidth}
      \flushright
      \miGrado
      \medskip

      \miFacultad
      \medskip

      \miUniversidad
    \end{minipage}
  }
