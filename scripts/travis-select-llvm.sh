LLVM_CONFIG_PATH=$(which $LLVM_CONFIG)
OLD_LLVM_CONFIG_PATH=$(which llvm-config)
sudo rm $OLD_LLVM_CONFIG_PATH
sudo ln -s $LLVM_CONFIG_PATH $OLD_LLVM_CONFIG_PATH