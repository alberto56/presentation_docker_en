#!/bin/bash
if [ "$#" -ne  "1" ]
  then
    echo "Please supply exactly one argument, not $#"
    echo ""
    echo "Usage:"
    echo ""
    echo "Interact with a container in the command line:"
    echo ""
    echo "./scripts/enter.sh 123abc"
else
  docker exec -t -i $1 bash
fi
