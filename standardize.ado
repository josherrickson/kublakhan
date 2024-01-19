*cap program drop standardize
program define standardize
	syntax varlist(min=1) [, noscale REplace SUffix(string)]
	
	* Ensure exactly one of `replace' or `suffix' is passed
	capture opts_exclusive "`replace' `suffix'"
	if _rc | "`replace'" == "" & "`suffix'" == "" {
		display as smcl as error "exactly  one of {bf:replace} or {bf:suffix} must specified"
		if _rc {
      exit _rc
		} 
		else {
			exit 198
		}
	}

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
		if substr("`:type `var''" , 1, 3) == "str" {
      display as txt "Skipping {input:`varname'}, strings cannot be standardized."
    }
    else {
      quietly summarize `var'
      if "`suffix'" != "" {
        gen `var'`suffix' = `var'
        local varname = "`var'`suffix'"
      }
      else {
        local varname = "`var'"
      }
      if "`scale'" != "noscale" {
        replace `varname' = (`varname' - r(mean))/r(sd)
      }
      else {
        replace `varname' = `varname' - r(mean)
      }
    }
	}
end
