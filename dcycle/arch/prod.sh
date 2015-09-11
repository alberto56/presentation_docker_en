echo ""
echo "This script should be called to take the existing contents of _site"
echo "and serve them with nginx. If you change the contents of site, you should"
echo "destroy the container and rerun this script."
echo ""
echo "For development, please use ./scripts/dev.sh instead."
echo ""

./scripts/build-dev.sh
./scripts/jekyll-build.sh
./scripts/kill-dev.sh

docker build -t docker-dcycleu-prod .
docker run -d -p 80:80 docker-dcycleu-prod
