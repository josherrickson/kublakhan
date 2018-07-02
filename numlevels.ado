program numlevels
	syntax varlist(min=1 max=1)
	qui levelsof `varlist'
	di `r(r)'
end
