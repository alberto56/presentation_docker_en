# build --watch does not work, nor does serve --watch. You must call this every time
# you want to build your site.
docker exec $(./scripts/container-dev.sh) bash -c 'cd /usr/share/site && jekyll build'
