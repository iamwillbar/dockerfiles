.PHONY=build
IMAGES=named-checkzone squid

workflows:
	cd .github/workflows; \
	$(foreach var,$(IMAGES),m4 template.m4 -DM4_IMAGE=$(var) > $(var).yml;)


build:
	cd named-checkzone && $(MAKE)
	cd named-checkzone-action && $(MAKE)

push:

