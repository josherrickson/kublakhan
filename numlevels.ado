program numlevels, rclass
	syntax varlist(min=1 max=1) [if] [in]
	qui levelsof `varlist' `if' `in'
	di `r(r)'
	return local r = `r(r)'
end
