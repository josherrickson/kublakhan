{smcl}
{* *! version 0.0.1  02jul2018}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "examplehelpfile##syntax"}{...}
{viewerjumpto "Description" "examplehelpfile##description"}{...}
{viewerjumpto "Options" "examplehelpfile##options"}{...}
{viewerjumpto "Remarks" "examplehelpfile##remarks"}{...}
{viewerjumpto "Examples" "examplehelpfile##examples"}{...}
{title:Title}

{phang}
{bf:numlevels} {hline 2} Return the number of unique levels of a variable.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:numlevels}
[{varlist}]
{ifin}

{p 4 6 2}
{cmd:by} is allowed; see {manhelp by D}.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:numlevels} calculates the number of unique levels of
{varlist}. This is similar to referring to {bf:r(r)} after calling
{manhelp levelsof P} but prints the results in a single command.


{marker examples}{...}
{title:Examples}

{phang2}{cmd:. sysuse auto, clear}{p_end}
{phang2}{cmd:. numlevels rep78}{p_end}
{phang2}{cmd:. numlevels rep78 if foreign == 1}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:numlevels} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(r)}}number of levels{p_end}
