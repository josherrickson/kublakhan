{smcl}
{* *! version 0.0.2  21feb2024}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "fencode##syntax"}{...}
{viewerjumpto "Description" "fencode##description"}{...}
{viewerjumpto "Options" "fencode##options"}{...}
{viewerjumpto "Examples" "fencode##examples"}{...}
{title:Title}

{phang}
{bf:fencode} {hline 2} Force the encoding of a string into numeric with labels, replacing the original.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:fencode}
[{varlist}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt label:suffix(string)}}An optional suffix to append to each generated label.{p_end}
{synopt :{opt overwrite:labels}}If existing labels with the same name (plus suffix if defined) exist, overwrite them.{p_end}


{marker description}{...}
{title:Description}

{pstd}
The {help encode} command does not support a {cmd:replace} option, leading to a frequent workflow of 1) using
{cmd:encode ..., generate(...)}, 2) reordering the variables, 3) deleting the original, 4) renaming the new
variable. {cmd:fencode} (for {bf:f}orce {bf:encode}) makes this one step. Additionally, it supports multiple
variables in the {varlist} at once.

{pstd}
If a non-string variable is passed, a message will be printed but no action taken. (Messages can be suppressed
with {help quietly} as desired.)


{marker examples}{...}
{title:Examples}

{phang2}{stata sysuse auto, clear:. sysuse auto, clear}{p_end}
{phang2}{stata fencode make mpg:. fencode make mpg}{p_end}