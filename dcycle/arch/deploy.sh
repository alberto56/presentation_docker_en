#!/bin/bash
if [ "$#" -ne  "2" ]
  then
    echo "Please supply exactly two arguments, not $#"
    echo ""
    echo "Usage:"
    echo ""
    echo "Deploy this site to a production environment:"
    echo ""
    echo "Argument #1: the ssh access to the target environment"
    echo "Argument #2: the path to the folder"
    echo ""
    echo "./scripts/deploy.sh me@1.2.3.4 dcycleu"
else
  ssh $1 "cd $2 && git pull origin master && ./scripts/kill-prod.sh && ./scripts/prod.sh"
fi
