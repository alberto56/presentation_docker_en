echo -e "[  >>] Start of script $0"
echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * "
echo -e "DCYCLE deploy.sh"
echo -e "See http://box.dcycle.com for instructions and"
echo -e "mode details."
echo -e "Type ./dcycle/deploy.sh without any arguments for help."
echo -e "* * * * * * * * * * * * * * * * * * * * * * * * \n"

# Make sure errors propagate throughout the script
set -e

$(dirname $0)/lib/preflight.sh

if [ "$#" -eq "0" ]
  then
    echo 'aaaaaaa'
    cat './dcycle/readme/deploy.txt'
else
  while getopts ":p:n:" opt; do
    case $opt in
      p) PORT="$OPTARG";
      ;;
      n) NAME="$OPTARG";
      ;;
      \?) echo "Invalid option -$OPTARG" >&2
      ;;
    esac
  done

  ENV='dev'

  if [ -z "$PORT" ]; then echo "[error] The argument -p is required. Use -p 80 if you're not sure what to use."; exit 1; fi
  if [ -z "$ENV" ]; then
    echo -e "[notice] The argument -e was not set, so we are assuming that you want to"
    echo -e "         deploy a development environment (dev). You can also use -e prod to"
    echo -e "         avoid installing development tools on your container."; ENV=dev;
  fi
  if [ -z "$NAME" ]; then
    echo -e "[notice] The argument -n was not set, so we are assuming 'normal'"
    NAME=normal;
  fi
  if [ $ENV != 'prod' ]; then
    if [ $ENV != 'dev' ]; then
      echo -e "[notice] The argument -e was set to $ENV, which is not valid. We are"
      echo -e "         assuming that you want to deploy a development environment (dev)."
      echo -e "         You can also use -e prod to avoid installing development tools on"
      echo -e "         your container."; ENV=dev;
    fi
  fi

  PROJECTNAME=$(basename $(pwd))-$ENV-$NAME

  echo -e "[info] The project name has been determined based on the directory name of"
  echo -e "       your project and environment type:"
  echo -e "       $PROJECTNAME"

  echo -e "[info] Creating _site directory if it does not exist"
  mkdir -p _site
  echo -e "[info] Starting build"
  ./dcycle/lib/build-$ENV.sh $PORT $PROJECTNAME
fi

echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * "
echo -e "DCYCLE deploy.sh"
echo -e "end of script."
echo -e "* * * * * * * * * * * * * * * * * * * * * * * * \n"
echo -e "[<<  ] End of script $0"
