.PHONY : build
build :
	@echo "build"
	@pipreqs . --encoding=utf8 --force

.PHONY : install
install :
	@echo "install tools"
	@pip3 install pipreqs