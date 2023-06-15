\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugrTFG}[2023/06/15 Clase de documento para elaboración TFG en Matemáticas según normativa de la Universidad de Granada]



% -------------------------------------------------------------------
% OPCIONES DE LA CLASE
% -------------------------------------------------------------------
% PRINT
\DeclareOption{print}{
  \KOMAoptions{fontsize=10pt, paper=a4, twoside=true, BCOR=5mm, DIV=10}
}

% TABLET
\DeclareOption{tablet}{
  \KOMAoptions{fontsize=10pt, paper=19.7104cm:14.7828cm, twoside=false, BCOR=0cm, DIV=14}
  % \PassOptionsToClass{\CurrentOption}{scrbook}
}
\DeclareOption{es-nodecimaldot}{
  % No cambia el punto decimal por una coma en modo matemático.
  \PassOptionsToPackage[es-nodecimaldot]{babel}
}

\DeclareOption{color}{
  \renewcommand{\archivoportada}{portada-ugr-sencilla-color}
}
\ProcessOptions\relax

\LoadClass[headings=normal, headsepline=false, cleardoublepage=empty, chapterprefix=false, appendixprefix=false,	listof=totoc, index=totoc, bibliography=totoc]{scrbook}

% -------------------------------------------------------------------
% PAQUETES
% ===================================================================

% -------------------------------------------------------------------
% IMAGEN DE LA PORTADA
% -------------------------------------------------------------------
% Existen varias opciones para la imagen de fondo de la portada del TFG. Todas ellas tienen en logotipo de la universidad de Granada en la cabecera. Las opciones son las siguientes:
% 1. portada-ugr y portada-ugr-color: diseño con marca de agua basada en el logo de la UGR (en escala de grises y color).
% 2. portada-ugr-sencilla y portada-ugr-sencilla-color: portada únicamente con el logotipo de la UGR en la cabecera.
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

\RequirePackage[utf8]{inputenc} 

\RequirePackage[english, spanish, es-nodecimaldot, es-noindentfirst, es-tabla]{babel}
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

% Las tipografías elegidas para el documento, siguiendo la guía de estilo de la UGR,
% son las siguientes
% Normal font: 			URW Palladio typeface. 
% Sans-serif font: 	Gill Sans
% Monospace font: 	Inconsolata
\RequirePackage[T1]{fontenc}
\RequirePackage[sc, osf]{mathpazo} \linespread{1.05}         
\RequirePackage[scaled=.95,type1]{cabin} % sans serif in style of Gill Sans
  % Si cabin da ERROR usar el siguiente comando en su lugar
  % \renewcommand{\sfdefault}{iwona} 
\RequirePackage{inconsolata}

\RequirePackage{setspace}
\RequirePackage{xspace} % Para problemas de espaciado al definir comandos

\RequirePackage{xurl}

% -------------------------------------------------------------------
\RequirePackage{hyperref}

% Opciones del paquete hyperref

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

\def\teoremaautorefname{Teorema}
\def\proposicionautorefname{Proposición}
\def\lemaautorefname{Lema}
\def\corolarioautorefname{Corolario}
\def\definicionautorefname{Def.}
\def\observacionautorefname{Observación}
\def\ejemploautorefname{E.j.}

% Pone automáticamente un parántesis para las ecuaciones
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
% Estilos de la clase KOMA
% -------------------------------------------------------------------
% Selecciona el tipo de fuente para los títulos (capítulo, sección, subsección) del documento.
\setkomafont{disposition}{\sffamily\bfseries}

% Cambia el ancho de la cita. Al inicio de un capítulo podemos usar el comando \dictum[autor]{cita} para añadir una cita famosa de un autor.
\renewcommand{\dictumwidth}{0.45\textwidth} 

\recalctypearea % Necesario tras definir la tipografía a usar.
