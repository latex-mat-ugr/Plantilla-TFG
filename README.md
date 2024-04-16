Plantilla TFG
=============

## Introducción
Este repositorio contiene una plantilla para la realización de un TFG mediante LaTeX que cumple con los [requisitos para la memoria de TFG](https://grados.ugr.es/matematicas/pages/infoacademica/tfg/requisitostfg/!) del Grado de Matemáticas de la Universidad de Granada.

Estos requisitos, según las [instrucciones](https://grados.ugr.es/matematicas/pages/infoacademica/tfg/requisitosTFG) para el curso 2023-2024 son los siguientes:

- La  memoria  debe  realizarse  con  un  procesador  de  texto  científico,  preferiblemente (La)TeX.
- La portada  debe contener  el  logo  de  la UGR,  incluir  el  título del TFG, el nombre del estudiante y especificar el grado, la facultad y el curso actual. La contraportada contendrá además el nombre del responsable o los responsables de la tutorización.
- La memoria debe necesariamente incluir:
  - Declaración explícita firmada en la que se asume la originalidad del trabajo, entendida en el sentido de que no ha utilizado fuentes sin citarlas debidamente. Esta declaración se puede descargar en la web del Grado y ha sido incorporada a esta plantilla,
	- un índice detallado de capítulos y secciones,
	- un resumen amplio en inglés del trabajo realizado (se recomienda entre 800 y 1500 palabras),
	- una introducción en la que se describan claramente los objetivos previstos inicialmente en la propuesta de TFG, indicando si han sido o no alcanzados, los antecedentes importantes para el desarrollo, los resultados obtenidos, en su caso y las principales fuentes consultadas,
	- una bibliografía final que incluya todas las referencias utilizadas.
- Se recomienda que la extensión de la memoria tenga unas 50 páginas, sin incluir posibles apéndices.

## Opciones de la plantilla
La plantilla hace uso de la clase `scrbook` del paquete `KOMA-Script` que normalmente viene instalado por defecto en las distribuciones de TeX más usuales. Dicha plantilla tiene las siguientes características:
- Tamaño de impresión: a4.
- Tipografía: [URW Palladio](http://www.tug.dk/FontCatalogue/urwpalladio/) (serif), [Cabin](http://www.tug.dk/FontCatalogue/cabin/) (sans-serif) e [Inconsolata](http://www.tug.dk/FontCatalogue/inconsolata/) (monospace). 

El fichero principal de la plantilla es `tfg.tex`. Al inicio del mismo (entre las líneas 13-32) es necesario modificar los datos del TFG: título, autor, grado, facultad y tutores mediante los comandos `\miTitulo`, `\miNombre`, `\miGrado`, `\miFacultad`, `\miUniversidad`, `\miTutor`.

En el fichero `tfg.pdf` se puede encontrar más información sobre la estructura de la plantilla y ejemplos de su uso.
