echo " + .vim/bundle/vundle"
vundle_path="${HOME}/.vim/bundle/vundle"
if [ -d "${vundle_path}" ]; then
  cd ${vundle_path} && git pull origin master
else
  git clone https://github.com/gmarik/vundle.git ${vundle_path}
fi

echo " + .vim/snippets"
snippets_path="${HOME}/.vim/snippets"
if [ -d "${snippets_path}" ]; then
  cd ${snippets_path} && git pull origin master
else
  git clone git://github.com/dmitrynix/snipmate-snippets.git ${snippets_path}
fi

echo " + .vim/colors"
mkdir -p ${HOME}/.vim/colors
cp ${directory_path}/files/github.vim ${HOME}/.vim/colors
cp ${directory_path}/files/atom-dark-256.vim ${HOME}/.vim/colors
cp ${directory_path}/files/atom-dark.vim ${HOME}/.vim/colors

echo " + vim bundle"
vim +BundleInstall +qall
vim +BundleUpdate +qall
