.PHONY=build
build:
	docker build . -t iamwillbar/named-checkzone

run:
	docker run -it -v type=bind,source=$(pwd),target=/root/zones iamwillbar/named-checkzone
