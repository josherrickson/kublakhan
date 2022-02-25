cap program drop bvtable
program bvtable
	syntax, [e]
	if "`e'" == "e" {
		local returntype = 1
	}
	else {
		local returntype = 0
	}
	mata: bv_to_table(`returntype')
	matrix list table
end


cap mata: mata drop bv_to_table()
mata: 
void bv_to_table(scalar returntype)
{
	if (returntype == 0) {
		b = st_matrix("r(b)")
		v = st_matrix("r(V)")
		row_names = st_matrixcolstripe("r(b)")
	}
	else
	{
		b = st_matrix("e(b)")
		v = st_matrix("e(V)")
		row_names = st_matrixcolstripe("e(b)")
	}

	se = sqrt( diagonal(v) )'
	z = b:/se
	pv = 2:*(1:- normal(abs(z)))
	lb = b - invnormal(.975) * se
	ub = b + invnormal(.975) * se

	//format as a matrix
	table_mat = (b', se', z', pv', lb', ub')
	st_matrix("table", table_mat)

	st_matrixrowstripe("table", row_names)

	col_names = J(6, 2, "")
	col_names[, 2] = ("diff", "se", "z", "pval", "LB", "UB")'
	st_matrixcolstripe("table", col_names)
}
end

sysuse auto
reg mpg price
nlcom _b[price]^2
bvtable
bvtable, e

