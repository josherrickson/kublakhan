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
{bf:fencode} {hline 2} Force the encoding of a string into numeric with labels, replacing the original.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:fencode}
[{varlist}]

{marker description}{...}
{title:Description}

{pstd}
{cmd:fencode} encodes string variables into numeric, replacing the original variable. {manhelp encode D} does
not support replacing, requiring several steps (encode to a new variable, drop the old variable, properly
order, rename). This does it in one step, as well as supporting multiple variables at once.


{marker examples}{...}
{title:Examples}

{phang2}{cmd:. sysuse auto, clear}{p_end}
{phang2}{cmd:. fencode make mpg}{p_end}