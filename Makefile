.PHONY : install_tool build

install_tool :
    pip3 install pipreqs
build :
    pipreqs . --encoding=utf8 --force