# This makefile is intended to test functions in makethmetic.mk

include makethmetic.mk

# TODO not working yet
define assert
$(info ASSERT '$(value $(1))' == '$(2)' $(shell echo "\033[32mOK\033[0m"))
endef

$(call test,2,2)

test:
	# 1981 + 42 = $(call add,1981,42)
	# 2024 - 1981 = $(call sub,2024,1981)
	# 6 * 8 = $(call mul,6,8)
	# 48 / 8 = $(call div,48,8)
	# 3 / 2 = $(call div,3,2)
	# 3 % 2 = $(call rem,3,2)
	# 9 / 3 = $(call div,9,3)
	# 9 % 3 = $(call rem,9,3)
	# 9 / 2 = $(call div,9,2)
	# 9 % 2 = $(call rem,9,2)
	# 7 / 3 = $(call div,7,3)
	# 1 / 2 = $(call div,1,2)
	# 1 / 1 = $(call div,1,1)
	# 2 / 2 = $(call div,2,2)
	# 2 % 2 = $(call rem,2,2)
	# 2 / 4 = $(call div,2,4)
