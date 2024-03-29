define test
$(info TEST '$(value $(1))' == '$(2)' $(shell echo "\033[32mOK\033[0m"))
endef

nine := x x x x x x x x x

define digit
$(wordlist 1,$(1),$(nine))
endef

$(call test,$(call digit,3),x x x)

$(info $(call digit,3))
$(info $(call digit,0))
$(info $(call digit,8))
$(info $(call digit,9))

#$(info $(findstring findstring,str))
#$(info $(words $(digits)))
#$(info $(wordlist 3,5,$(digits)))
#$(info $(foreach i,$(digits),$(foreach j,$(digits),$(i)$(j))))
