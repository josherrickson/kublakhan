gprogram numlevels, rclass
	syntax varlist(min=1 max=1) [if] [in]
	qui levelsof `varlist' `if' `in'
	di `r(r)'
	return scalar r = `r(r)'
end
