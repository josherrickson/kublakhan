{smcl}
{* *! version 0.0.1  25feb2022}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "bvtable##syntax"}{...}
{viewerjumpto "Description" "bvtable##description"}{...}
{viewerjumpto "Options" "bvtable##options"}{...}
{viewerjumpto "Examples" "bvtable##examples"}{...}
{title:Title}

{phang}
{bf:bvtable} {hline 2} Creates a matrix "table" when a command returns only "b" and "V" matrices.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:bvtable}
	[{cmd:, e}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt e}}Make {cmd:bvtable} look in {cmd:ereturn} instead of {cmd:return}{p_end}


{marker description}{...}
{title:Description}

{pstd}
Many commands, such as {cmd:regress} and {cmd:nlcom}, return a coefficient matrix ({cmd:r(b)} or {cmd:e(b)}) and a covariance matrix ({cmd:e(V)} or {cmd:r(V)}) yet don't return the printed table which will include p-values and confidence intervals. {cmd:bvtable} will print and return the table in {cmd:table} for further use.

{pstd}
By default, {cmd:bvtable} will look at {cmd:r(b)} and {cmd:r(V)}, but if the open {cmd:e} is included, it will instead look in {cmd:e(b)} and {cmd:e(V)}.

{marker examples}{...}
{title:Examples}

{phang2}{stata sysuse auto, clear:. sysuse auto, clear}{p_end}
{phang2}{stata regress headroom mpg:. regress headroom mpg}{p_end}
{phang2}{stata nlcom exp(_b[mpg]):. nlcom exp(_b[mpg])}{p_end}
{cmd:nlcom} places the {cmd:b} and {cmd:V} matrices in {cmd:return}:
{phang2}{stata bvtable:. bvtable}{p_end}
{phang2}{stata matrix list table:. matrix list table}{p_end}
We can still access the table from {cmd:regress} since it places {cmd:b} and {cmd:V} matrices in {cmd:ereturn}:
{phang2}{stata bvtable, e:. bvtable, e}{p_end}
