DIRS := Splash-3

all: $(DIRS)
clean: $(DIRS)
semiclean: $(DIRS)
bindCores: $(DIRS)
bindThreads: $(DIRS)
$(DIRS):
	+$(MAKE) -C $@ $(MAKECMDGOALS)


.PHONY: everything all clean semiclean bindCores bindThreads $(DIRS)
