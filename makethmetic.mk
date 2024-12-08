# Exponentially grows a list of '|' (stick-list) given in $(2) untill its length
# exceeds a length given in $(1)
# E.g. $(call _grow,5,| |) produces the string within quotes: '| | | | | | | |'
_grow = $(if $(word $(1),$(2)),$(2),$(call _grow,$(1),$(subst |,| |,$(2))))

# Converts a decimal number N given in $(1) to its "scattered" representation
# as a list of N '|' (stick-list)
# e.g. $(call _scatter,5) gives '| | | | |'
# The opposite operation can be done by the "words" built-in function
_scatter = $(if $(filter 0,$(1)),,$(wordlist 1,$(1),$(call _grow,$(1),| |)))

# Tests whether the stick-list in $(1) is greater or equal to the stick-list in $(2)
_greater_or_equal = $(word $(words $(2)),$(1))

# Adds (i.e. concatenates) two stick-lists
_add = $(1) $(2)

# Multiplicates two stick-lists
_mul = $(subst |,$(1),$(2))

# Subtracts a stick-list given in $(2) from the stick-list given in $(1)
_sub = $(filter-out ||,$(join $(1),$(2)))

# Divides a stick-list given in $(1) by the stick-list given in $(2)
_div = $(if $(call _greater_or_equal,$(1),$(2)),| $(call _div,$(call _sub,$(1),$(2)),$(2)),)

# Adds two decimal values
+ = $(words $(call _add,$(call _scatter,$(1)),$(call _scatter,$(2))))

# Multiplicates two decimal values
* = $(words $(call _mul,$(call _scatter,$(1)),$(call _scatter,$(2))))

# Subtracts decimal value given in $(2) from the decimal $(1)
- = $(words $(call _sub,$(call _scatter,$(1)),$(call _scatter,$(2))))

# Divids decimal value given in $(1) by the decimal $(2)
/ = $(words $(call _div,$(call _scatter,$(1)),$(call _scatter,$(2))))

# Calculates expression in $(1), which has a form "| (operator) y"
calc = $(call $(word 2,$(1)),$(word 1,$(1)),$(word 3,$(1)))
