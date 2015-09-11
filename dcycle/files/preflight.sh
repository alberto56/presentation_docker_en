# Make sure errors propagate throughout the script
set -e

if [ "$(dirname $0)" != "./dcycle/files" ];then
  echo -e "[error] The folder dcycle and its contents must be at the root of your"
  echo -e "        project, and must be called from the root of your project. That"
  echo -e "        is, for example, you must call ./dcycle/deploy.sh so that the location"
  echo -e "        (parent directory) of preflight.sh is ./dcycle/files; it is currently"
  echo -e "        $(dirname $0)."
  exit 1;
fi

if [ ! -f ./Dockerfile-jekyll ];then
  echo -e "[error] Dockerfile-jekyll must exist. Please make sure that you correctly"
  echo -e "        installed "
  echo -e "        the dcycle scripts on your project, by copying the dcycle folder, and"
  echo -e "        Dockerfile, etc. to your project root."
  exit 1;
fi

if [ ! -f ./Dockerfile-nginx ];then
  echo -e "[error] Dockerfile-nginx must exist. Please make sure that you correctly"
  echo -e "        installed "
  echo -e "        the dcycle scripts on your project, by copying the dcycle folder, and"
  echo -e "        Dockerfile, etc. to your project root."
  exit 1;
fi
