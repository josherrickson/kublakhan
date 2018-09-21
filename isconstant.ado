cap prog drop isconstant
program isconstant
	syntax varlist(min=2)
	tokenize `varlist'
	local i = 2
	while "``i''" != "" {
		local varname "``i''"
		
		capture bysort ``1'' (`varname') : assert (`varname' == `varname'[1]) | missing(`varname')
		if  _rc != 0 {
						di "Not constant: `varname'"
		}
		else {
						di "Constant: `varname'"
		}
		local i = `i' + 1
	}
end

isconstant foreign mpg price
