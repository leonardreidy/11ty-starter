# Detect operating system in Makefile.
# From:
# 	https://gist.github.com/sighingnow/deee806603ec9274fd47
OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG = WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG := AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG := IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG := LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG := OSX
	endif
		UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		OSFLAG := AMD64
	endif
		ifneq ($(filter %86,$(UNAME_P)),)
	OSFLAG := IA32
		endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG := ARM
	endif
endif

osflag:
	@echo $(OSFLAG)