docker build -f="Dockerfile-dev" -t docker-dcycleu-dev .
docker run -d -p 80:80 -v $(pwd):/usr/share/site/ docker-dcycleu-dev
