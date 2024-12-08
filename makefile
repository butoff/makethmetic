# This makefile is intended to exercise functions in makethmetic.mk
# For testing, just call make(1) within the directory containing this file

include makethmetic.mk

_succ := 0
_fail := 0
_all := 0

assert = $(info assert $1 = $2:\
  $(if $(filter $2,$(call calc,$1)),\
  $(shell echo "\033[32mOK\033[0m")\
    $(eval _succ = $(call calc,1 + $(_succ))),\
  $(shell echo "\033[31mFAIL: expected $2, actual $(call calc,$1)\033[0m")\
    $(eval _fail = $(call calc,1 + $(_fail)))))
    $(eval _all = $(call calc,1 + $(_all)))

$(call assert,1 + 0,1)
$(call assert,2 + 3,5)
$(call assert,3 + 2,5)
$(call assert,3 - 2,1)
$(call assert,3 * 2,6)
$(call assert,13 / 4,3)

_all := $(call calc,$(_succ) + $(_fail))

.PHONY: summary

summary:
	@echo --------------------------------------------------------
	@echo $(_all) tests executed, $(_succ) passed, $(_fail) failed
