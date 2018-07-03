program numlevels, rclass
	syntax varlist(min=1 max=1) [if] [in]
	qui levelsof `varlist' `if' `in'
	display as result `r(r)'
	return scalar r = `r(r)'
end
