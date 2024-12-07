# exponentially grows a list of 'x' (x-list) given in $(2) untill its length
# exceeds an length given in $(1)
# e.g. $(call _grow,5,x x) produces the string within quotes: 'x x x x x x x x'
_grow = $(if $(word $(1),$(2)),$(2),$(call _grow,$(1),$(subst x,x x,$(2))))

# converts a decimal number N given in $(1) to its "scattered" representation
# as a list of N 'x' (x-list)
# e.g. $(call _scatter,5) gives 'x x x x x'
# The opposite operation can be done by the "words" built-in function
_scatter = $(wordlist 1,$(1),$(call _grow,$(1),x x))

# tests whether the x-list in $(1) is greater or equal to the x-list in $(2)
_greater_or_equal = $(word $(words $(2)),$(1))

# adds (i.e. concatenates) two x-lists
_add = $(1) $(2)

# multiplicates two x-lists
_mul = $(subst x,$(1),$(2))

# subtracts a x-list given in $(2) from the x-list given in $(1)
_sub = $(filter-out xx,$(join $(1),$(2)))

# divides a x-list given in $(1) by the x-list given in $(2)
_div = $(if $(call _greater_or_equal,$(1),$(2)),x $(call _div,$(call _sub,$(1),$(2)),$(2)),)

# adds two decimal values
add = $(words $(call _add,$(call _scatter,$(1)),$(call _scatter,$(2))))

# multiplicates two decimal values
mul = $(words $(call _mul,$(call _scatter,$(1)),$(call _scatter,$(2))))

# subtracts decimal value given in $(2) from the decimal $(1)
# !! Negative values not supported yet.
# !! A caller is responsible for holding $(1) > $(2)
sub = $(words $(call _sub,$(call _scatter,$(1)),$(call _scatter,$(2))))

# divids decimal value given in $(1) by the decimal $(2)
div = $(words $(call _div,$(call _scatter,$(1)),$(call _scatter,$(2))))
