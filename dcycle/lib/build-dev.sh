# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0"

PORT=$1
PROJECTNAME=$2

docker build -f="Dockerfile-dcycle-jekyll" -t $PROJECTNAME-jekyll .
docker run -d -v $(pwd):/srv/jekyll/ $PROJECTNAME-jekyll /bin/bash -c 'jekyll build --watch --force_polling'

docker build -f="Dockerfile-dcycle-nginx" -t $PROJECTNAME-nginx .
docker run -d -p $PORT:80 -v $(pwd)/_site:/usr/share/nginx/html/ $PROJECTNAME-nginx
echo -e "[<<  ] End of script $0"
