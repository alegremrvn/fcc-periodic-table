#!/bin/bash

PSQL="psql --no-align --tuples-only --username=freecodecamp --dbname=periodic_table -c "

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  RESPONDED=0

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER_QUERY="$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")"
    if [[ ! -z $ATOMIC_NUMBER_QUERY ]]
    then
      SYMBOL="$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      TYPE_ID="$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      TYPE="$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")"
      ATOMIC_MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      MELTING_POINT="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      BOILING_POINT="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      echo "The element with atomic number $ATOMIC_NUMBER_QUERY is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      RESPONDED=1
    fi
  fi

  if [[ $RESPONDED == 0 ]]
  then
    ATOMIC_NUMBER_QUERY="$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")"
    if [[ ! -z $ATOMIC_NUMBER_QUERY ]]
    then
      SYMBOL="$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      TYPE_ID="$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      TYPE="$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")"
      ATOMIC_MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      MELTING_POINT="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      BOILING_POINT="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      echo "The element with atomic number $ATOMIC_NUMBER_QUERY is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      RESPONDED=1
    fi
  fi

  if [[ $RESPONDED == 0 ]]
  then
    ATOMIC_NUMBER_QUERY="$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")"
    if [[ ! -z $ATOMIC_NUMBER_QUERY ]]
    then
      SYMBOL="$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      TYPE_ID="$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      TYPE="$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")"
      ATOMIC_MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      MELTING_POINT="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      BOILING_POINT="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_QUERY")"
      echo "The element with atomic number $ATOMIC_NUMBER_QUERY is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      RESPONDED=1
    fi
  fi

  if [[ $RESPONDED == 0 ]]
  then
    echo "I could not find that element in the database."
  fi
fi
