echo -e "[  >>] Start of script $0"
# Make sure errors propagate throughout the script
set -e

if [ "$(dirname $0)" != "./dcycle/lib" ];then
  echo -e "[error] The folder dcycle and its contents must be at the root of your"
  echo -e "        project, and must be called from the root of your project. That"
  echo -e "        is, for example, you must call ./dcycle/deploy.sh so that the location"
  echo -e "        (parent directory) of preflight.sh is ./dcycle/lib; it is currently"
  echo -e "        $(dirname $0)."
  exit 1;
fi

if [ ! -f ./Dockerfile-dcycle-jekyll ];then
  echo -e "[error] Dockerfile-dcycle-jekyll must exist. Please make sure that you correctly"
  echo -e "        installed "
  echo -e "        the dcycle scripts on your project, by copying the dcycle folder, and"
  echo -e "        Dockerfile, etc. to your project root."
  exit 1;
fi

if [ ! -f ./Dockerfile-dcycle-nginx ];then
  echo -e "[error] Dockerfile-dcycle-nginx must exist. Please make sure that you correctly"
  echo -e "        installed "
  echo -e "        the dcycle scripts on your project, by copying the dcycle folder, and"
  echo -e "        Dockerfile, etc. to your project root."
  exit 1;
fi
echo -e "[<<  ] End of script $0"
