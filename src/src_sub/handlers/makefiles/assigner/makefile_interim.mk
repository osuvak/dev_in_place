# /*
#  * This file is part of the "dev_in_place" repository located at:
#  * https://github.com/osuvak/dev_in_place
#  * 
#  * Copyright (C) 2017  Onder Suvak
#  * 
#  * For licensing information check the above url.
#  * Please do not remove this header.
#  * */

include $(HOME)/dev_in_place/makefiles/common/commands_flags.mk
include $(HOME)/dev_in_place/makefiles/common/extensions.mk
include $(HOME)/dev_in_place/makefiles/common/paths.mk

# get list of directories
DIR_ALL_RAW := $(sort $(dir $(wildcard ./*/)))
DIR_ALL_RAW := $(filter-out ./,$(DIR_ALL_RAW))
DIR_ALL_RAW := $(patsubst %/,%,$(DIR_ALL_RAW))
DIR_ALL_RAW := $(notdir $(DIR_ALL_RAW))

DIR_ELIMINATED := $(sort $(dir $(wildcard ./_ignore*/)))
DIR_ELIMINATED := $(filter-out ./,$(DIR_ELIMINATED))
DIR_ELIMINATED := $(patsubst %/,%,$(DIR_ELIMINATED))
DIR_ELIMINATED := $(notdir $(DIR_ELIMINATED))

DIR_ALL := $(filter-out $(DIR_ELIMINATED),$(DIR_ALL_RAW))
DIRS    := $(DIR_ALL)

default : build help force_look
	@true;
	
build : force_look
	@set -o pipefail -e; \
	for d in $(DIRS); do cd $$d && $(MAKE) && cd ..; done

mkdirtarget : force_look
	@set -o pipefail -e; \
	for d in $(DIRS); do cd $$d && $(MAKE) mkdirtarget && cd ..; done

realclean : force_look
	@set -o pipefail -e; \
	for d in $(DIRS); do cd $$d && $(MAKE) realclean && cd ..; done
	
allclean : force_look
	@set -o pipefail -e; \
	for d in $(DIRS); do cd $$d && $(MAKE) allclean && cd ..; done
	
clean : force_look
	@set -o pipefail -e; \
	for d in $(DIRS); do cd $$d && $(MAKE) clean && cd ..; done
	
cleankdev : force_look
	@set -o pipefail -e; \
	for d in $(DIRS); do cd $$d && $(MAKE) cleankdev && cd ..; done
	
help : force_look
	@echo ""
	@echo "RECIPES"
	@echo ""
	@echo "help        - prints this help"
	@echo "default     - builds and helps"
	@echo "build       - builds calling default recipes in subdirectories"
	@echo "realclean   - cleans target directories and global directory for binaries (if applicable)"
	@echo "allclean    - cleans target directories and global directory of relevant targets (if applicable)"
	@echo "clean       - cleans target directories only"
	@echo "cleankdev   - calls KDevelop fragments cleaners in subdirectories"
	@echo ""
	@true;
	
force_look :
	@true;
