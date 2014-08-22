echo " + local/Binary"
binaries="${HOME}/local/Binary"
if [ -d "${binaries}" ]; then
  cd ${binaries} && git pull origin master
else
  mkdir -p "${HOME}/local"
  git clone git://github.com/dmitrynix/Binary.git ${binaries}
fi
