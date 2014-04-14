echo " + Local/Binary"
binaries="${HOME}/Local/Binary"
if [ -d "${binaries}" ]; then
  cd ${binaries} && git pull origin master
else
  mkdir -p "${HOME}/Local"
  git clone git://github.com/dmitrynix/Binary.git ${binaries}
fi
