#!/bin/bash

## Check if pest is in path
PEST=`which pest.erl`
ESCRIPT=`which escript`
if [[ -f "$PEST" ]]
then
    pest.erl -ev $1
else
    if [[ -f "$ESCRIPT" ]]
    then
        echo "INFO: For quicker workflow, git clone https://github.com/okeuday/pest and add pest.erl to $PATH"
    fi

    DIR=`dirname "${BASH_SOURCE[0]}"`
    HASH=`git --git-dir=$DIR/.git rev-parse --short HEAD`
    NAME="pre-commit-erlang-pest"
    docker build $DIR --tag $NAME:$HASH
    docker run --rm -v $PWD:/src:rw,Z --workdir /src $NAME:$HASH "/pest/pest.erl" -ev $1
fi

