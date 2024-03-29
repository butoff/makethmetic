# exponentially grows a list of 'x' (x-list) given in $(2) untill its length
# exceeds an length given in $(1)
# $(call _grow,5,x x) -> x x x x x x x x
_grow = $(if $(word $(1),$(2)),$(2),$(call _grow,$(1),$(subst x,x x,$(2))))

# converts a decimal number N given in $(1) to its "scattered" representation
# as a list of N 'x' (x-list)
# $(call _scatter,5) -> x x x x x
_scatter = $(wordlist 1,$(1),$(call _grow,$(1),x x))

# converts an x-list given in $(1) to its human-readable decimal representation
# $(call _gather,x x x) -> 3
_gather = $(words $(1))

# adds (i.e. concatenates) two x-lists
_add = $(1) $(2)

# multiplicates two x-lists
_mul = $(subst x,$(1),$(2))

# subtracts an x-list given in $(2) from the x-list given in $(1)
_sub = $(filter-out xx,$(join $(1),$(2)))

# adds two decimal values
# $(call add,2,3) -> 5
add = $(call _gather,$(call _add,$(call _scatter,$(1)),$(call _scatter,$(2))))

# multiplicates two decimal values
# $(call mul,2,3) -> 6
mul = $(call _gather,$(call _mul,$(call _scatter,$(1)),$(call _scatter,$(2))))

# subtracts decimal value given in $(2) from the decimal $(1)
# !! Negative values not supported yet.
# !! A caller is responsible for holding $(1) > $(2)
# $(call sub,3,2) -> 1
sub = $(call _gather,$(call _sub,$(call _scatter,$(1)),$(call _scatter,$(2))))

all:
	# 1981 + 42 = $(call add,1981,42)
	# 2024 - 1981 = $(call sub,2024,1981)
	# 6 * 8 = $(call mul,6,8)
