*cap program drop standardize
program define standardize
	syntax varlist(min=1 numeric) [, noscale SUffix(string)]
	
	* Ensure if suffix is passed, no name conflicts
	if "`suffix'" != "" {
		local exit = 0
		foreach var of varlist `varlist' {
			capture confirm variable `var'`suffix', exact
			if !_rc {
				display as error "Adding suffix '`suffix'' to '`var'' produces '`var'`suffix'' which is already defined"
				local exit = 1
			}
		}
		if `exit' == 1 {
			exit 110
		}
	}
	
	
	
	foreach var of varlist `varlist' {
		quietly summarize `var'
		if "`suffix'" != "" {
			gen `var'`suffix' = `var'
			local varname = "`var'`suffix'"
		}
		else {
			local varname = "`var'"
		}
		replace `varname' = `varname' - r(mean)
 		if "`scale'" != "noscale" {
 			replace `varname' = `varname'/r(sd)
 		}
	}
		
		

end
