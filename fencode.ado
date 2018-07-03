program fencode
	syntax varlist(min=1)
	tokenize `varlist'
	local i = 1
	while "``i''" != "" {
		local varname "``i''"

		if substr("`:type `varname''" , 1, 3) == "str" {
			encode `varname', gen(`varname'2)
			order `varname'2, after(`varname')
			drop `varname'
			rename `varname'2 `varname'
			display as txt "Variable {input:`varname'} encoded."
		}
		else {
			display as txt "Skipping {input:`varname'}, not a string."
		}
		local i = `i' + 1
	}
end
