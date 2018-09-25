program fencode
	syntax varlist(min=1) [, LABELsuffix(string) OVERWRITElabels]
	tokenize `varlist'
	local i = 1
	while "``i''" != "" {
		local varname "``i''"

		if substr("`:type `varname''" , 1, 3) == "str" {
			capture label list `varname'`labelsuffix'
			* If a label (with suffix) already exists, and we're not overwriting, error.
			if _rc == 0 & "`overwritelabels'" != "overwritelabels" {
				di as error in smcl "value label {input:`varname'`labelsuffix'} already exists"
				di as error "provide a unique {opt labelsuffix(string)} or pass the {opt overwritelabels} option"
				exit
			}
			* If overwriting labels, try dropping the label first
			if "`overwritelabels'" == "overwritelabels" {
				capture label drop `varname'`labelsuffix'
			}
			* __TMP__ is used to try and avoid name conflicts
			encode `varname', gen(`varname'__TMP__) label(`varname'`labelsuffix')
			order `varname'__TMP__, after(`varname')
			drop `varname'
			rename `varname'__TMP__ `varname'
			display as txt "Variable {input:`varname'} encoded."
		}
		else {
			display as txt "Skipping {input:`varname'}, not a string."
		}
		local i = `i' + 1
	}
end
