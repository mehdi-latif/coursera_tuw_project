#!/bin/bash
# File : guessinggame.sh
function generate_files {
    local m=$1; local M=$2; local ext=$3;
    # Clean the space (ie the file.ext)
    find . -name "*$ext" -exec rm -rf {} \;
    # Generate R new files
    R=$(( $RANDOM % $M + $m ));
    for j in $(seq $1 $R); do # maybe easier with braces
      touch $j$ext;
    done
}
function play {
    local C=0;        # number of tries
    local G=-1;       # Default guess value
    if [[ "$3" = ".sh" ]] ; then
        echo "choose a correct format for files (ie. different of .sh)";
    else
      # Start the game by generates randomly R files
      generate_files $1 $2 $3
      # Count the number of files (not including '.' or '..');
      let N=-1+$(find . ! -name . -prune -print | grep -c /);
      # Let's go
      echo "Let's play a game : How many file(s) in this directory ?"
      while [[ $G -ne $N ]]; do
          echo -e ">> Give me an integer \t [+enter]";   read G;
          if [[ ! $G =~ ^[0-9]*$ ]]; then
              echo ">>> Not the correct format !";
              continue;
          else
              ((C++));
              if [[ "$G" -lt "$N" ]]; then
                  echo ">>>> The files number is greater than $G"
              elif [[ "$G" -gt "$N" ]]; then
                  echo ">>>> The files number is less than $G"
              else
                  echo ">>>> It's OK, you got it (in $C tries)"
              fi
          fi
          #echo "N=$N/G=$G/C=$C";
      done
    fi
}
# MAIN : play function
# params : $1 : min value for random generation of R files
#          $2 : max value for random generation of R files
#          $3 : files extension (error message if ext='.sh')
play 1 10 '.txt'
#play 1 10 '.sh'
