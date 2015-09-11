# Make sure errors propagate throughout the script
set -e

PORT=$1
PROJECTNAME=$2

docker build -f="Dockerfile-jekyll" -t $PROJECTNAME-jekyll .
docker run -v $(pwd):/srv/jekyll/ $PROJECTNAME-jekyll /bin/bash -c 'jekyll build'

docker build -f="Dockerfile-nginx" -t $PROJECTNAME-nginx .
docker run -d -p $PORT:80 $PROJECTNAME-nginx
