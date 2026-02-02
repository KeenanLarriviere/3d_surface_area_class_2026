#!/bin/bash

#this program takes output from admesh and makes a tidy TSV


#to run:

#bash admesh2tsv.bash <admesh output file>
 
#bash admesh2tsv.bash admesh.out > admesh.tsv


#read in arguments from command line
INPUTFILE=$1
TIDYDATAFILE=$2

#create header row and save to variable
HEADER=$(echo -e FileName'\t'MinX'\t'MaxX'\t'MinY'\t'MaxY'\t'MinZ'\t'MaxZ'\t'FacetsBefore'\t'FacetsAfter'\t'DisconnectedFacetsBefore'\t'DisconnectedFacetsAfter'\t'Volume'\t'SurfArea)

#create file name column and save to variable
FILENAMES=$(grep '^Input file' $INPUTFILE | sed 's/ //g' | sed 's/Inputfile://g')

#create min and max x columns
MINMAXX=$(grep '^Min X' $INPUTFILE | sed 's/ //g' | sed 's/M[ai][nx]X=//g')

#create min and max y columns
MINMAXY=$(grep '^Min Y' $INPUTFILE | sed 's/ //g' | sed 's/M[ai][nx]Y=//g' )

#create min and max z columns
MINMAXZ=$(grep '^Min Z' $INPUTFILE | sed 's/ //g' | sed 's/M[ai][nx]Z=//g')

#create facet before and after column
FACETINFO=$(grep '^Number of facets' $INPUTFILE | sed 's/Number of facets  *: *//g' | sed 's/  */\t/g')

#create total disconnected facet column
DISCONNECTEDFACET=$(grep '^Total disconnected facets' $INPUTFILE | sed 's/Total disconnected facets  *: *//g' | sed 's/  */\t/g')

#create volume column
VOLUME=$(grep 'Volume' $INPUTFILE | sed 's/Number of parts *:.*Volume *: *//g')

#create surface area column
SURFACEAREA=$(grep 'Surface area' $INPUTFILE | sed 's/Degenerate facets *:.*Surface area *: *//g')

#create tidy data file
cat <(echo -e "$HEADER") \
<(\
paste -d '\t' <(echo "$FILENAMES") \
<(echo "$MINMAXX" | tr ',' '\t') \
<(echo "$MINMAXY" | tr ',' '\t') \
<(echo "$MINMAXZ" | tr ',' '\t') \
<(echo "$FACETINFO") \
<(echo "$DISCONNECTEDFACET") \
<(echo "$VOLUME") \
<(echo "$SURFACEAREA") \
) > $TIDYDATAFILE





