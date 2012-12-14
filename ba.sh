#!/bin/bash

#################################################################
# Dieses Script Fügt die einzelnen Texte die in *Markdown*      #
# Geschrieben sind, zu einer fertig formatierten PDF zusammen.  #
#                                                               #
#  Peter Flucher                                                # 
#################################################################





#-----------------------------------------------------------------
# Hier wird die Reihenfolge der Kapitel festgelegt
#
# Pandoc und LaTeX muss installiert sein.


b=text # Variable definieren


# pandoc texte/titel.markdown $b.md \
#   --output $b.pdf\
#   --template=vorlagen/default.tex\
#   --chapters\
#   --table-of-contents\
#   --bibliography=literatur/primaer.bib\
#   --bibliography=literatur/sekundaer.bib\
#   --biblatex;


  pandoc\
  texte/titel.md \
  texte/einleitung.md \
  texte/hauptteil.md \
  texte/schluss.md \
  --output $b.tex\
  --template=vorlagen/default.tex\
  --table-of-contents\
  --bibliography=literatur/literatur.bib\
  --biblatex \
  --standalone;


  pdflatex $b.tex 

  biber $b;

  pdflatex $b.tex

  echo " "
  echo "LaTeX-Dateien löschen..."
  echo " "

  rm $b.run.xml $b.out $b.toc $b.tex \
  $b.log $b.blg $b.bbl $b.bcf $b.aux;

