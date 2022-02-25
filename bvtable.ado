*cap program drop bvtable
program bvtable
	syntax, [e noci nopv]
	if "`e'" == "e" {
		local returntype = 1
	}
	else {
		local returntype = 0
	}
	if "`ci'" == "noci" {
		local noci = 1
	}
	else {
		local noci = 0
	}
	if "`pv'" == "nopv" {
		local nopv = 1
	}
	else {
		local nopv = 0
	}
	mata: bv_to_table(`returntype', `noci', `nopv')
	matrix list table
end

*cap mata: mata drop bv_to_table()
mata: 
void bv_to_table(scalar returntype, scalar noci, scalar nopv)
{
	if (returntype == 1) {
		b = st_matrix("e(b)")'
		v = st_matrix("e(V)")
		rownames = st_matrixcolstripe("e(b)")
	}
	else
	{
		b = st_matrix("r(b)")'
		v = st_matrix("r(V)")
		rownames = st_matrixcolstripe("r(b)")
	}

	se = sqrt( diagonal(v) )
	table = (b, se)
	colnames = ("", "Coefficient" \ "", "Std. Err.")
	if (nopv == 0) {
		z = b :/ se
		pv = 2 :* (1 :- normal(abs(z)))
		table = (table, z, pv)
		colnames = (colnames \ ("", "z" \ "", "P>|z|"))
	}
	if (noci == 0) {
		lb = b - invnormal(.975) * se
		ub = b + invnormal(.975) * se
		table = (table, lb, ub)
		colnames = (colnames \ ("", "[95% conf." \ "", "interval]"))
	}

	st_matrix("table", table)
	st_matrixrowstripe("table", rownames)
	st_matrixcolstripe("table", colnames)
}
end


