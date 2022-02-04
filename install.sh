#/bin/bash

echo "Installing required files and config..."

CURRENTDIR=${PWD}
VIM_CONFIG_DIR=$HOME/.config/nvim
VIM_LOCAL_DIR=$HOME/.local/share/nvim

curl -LOs https://github.com/neovim/neovim/releases/latest/download/nvim.appimage > /dev/null
chmod u+x nvim.appimage

# CUSTOM_NVIM_PATH=/usr/local/bin/nvim.appimage
CUSTOM_NVIM_PATH=$CURRENTDIR/nvim.appimage

# Set the above with the correct path, then run the rest of the commands:
set -u
sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1 &

mkdir -p $VIM_CONFIG_DIR
cp $CURRENTDIR/init.vim $VIM_CONFIG_DIR
cp -r $CURRENTDIR/ultisnips $VIM_CONFIG_DIR

