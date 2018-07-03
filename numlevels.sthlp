{smcl}
{* *! version 0.0.1  02jul2018}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "numlevels##syntax"}{...}
{viewerjumpto "Description" "numlevels##description"}{...}
{viewerjumpto "Examples" "numlevels##examples"}{...}
{viewerjumpto "Stored results" "numlevels##results"}{...}
{title:Title}

{phang}
{bf:numlevels} {hline 2} Return the number of unique levels of a variable.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:numlevels}
[{varname}]
{ifin}


{marker description}{...}
{title:Description}

{pstd}
{cmd:numlevels} calculates the number of unique levels of
{varname}. This is similar to referring to {input:r(r)} after calling
{help levelsof} but prints the results in a single command.


{marker examples}{...}
{title:Examples}

{phang2}{stata sysuse auto:. sysuse auto}{p_end}
{phang2}{stata numlevels rep78:. numlevels rep78}{p_end}
{phang2}{stata numlevels rep78 if foreign == 1:. numlevels rep78 if foreign == 1}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:numlevels} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:r(r)}}number of levels{p_end}
