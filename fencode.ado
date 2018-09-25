program fencode
	syntax varlist(min=1)
	tokenize `varlist'
	local i = 1
	while "``i''" != "" {
		local varname "``i''"

		if substr("`:type `varname''" , 1, 3) == "str" {
			encode `varname', gen(`varname'__TMP__)
			order `varname'__TMP__, after(`varname')
			drop `varname'
			rename `varname'__TMP__ `varname'
      label copy `varname'__TMP__ `varname'_label
      label drop `varname'__TMP__
      label values `varname' `varname'_label
			display as txt "Variable {input:`varname'} encoded."
		}
		else {
			display as txt "Skipping {input:`varname'}, not a string."
		}
		local i = `i' + 1
	}
end
