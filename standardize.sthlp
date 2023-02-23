{smcl}
{* *! version 0.0.2  22feb2023}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "standardize##syntax"}{...}
{viewerjumpto "Description" "standardize##description"}{...}
{viewerjumpto "Options" "standardize##options"}{...}
{viewerjumpto "Examples" "standardize##examples"}{...}
{title:Title}

{phang}
{bf:standardize} {hline 2} Centers and scales variables


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:standardize}
	[{cmd:, noscale suffix}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt noscale}}Do not scale variables, only center.{p_end}
{synopt :{opt suffix}}If provided, generate new variables with the given suffix. If not provided, replace existing variables.{p_end}


{marker description}{...}
{title:Description}

{pstd}
For each variable, center the variables (to have mean 0) and optionally scale (to have variance 1).

{marker examples}{...}
{title:Examples}

{phang2}{stata sysuse auto, clear:. sysuse auto, clear}{p_end}
{phang2}{stata standardize price mpg:. standardize price mpg}{p_end}
{phang2}{stata standardize length weight, noscale:. standardize length weight, noscale}{p_end}
{phang2}{stata standardize turn headroom, suffix("_z"):. standardize turn headroom, suffix("_z")}{p_end}
