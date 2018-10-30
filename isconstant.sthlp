{smcl}
{* *! version 0.0.1  02jul2018}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "isconstant##syntax"}{...}
{viewerjumpto "Description" "isconstant##description"}{...}
{viewerjumpto "Options" "isconstant##options"}{...}
{viewerjumpto "Examples" "isconstant##examples"}{...}
{title:Title}

{phang}
{bf:isconstant} {hline 2} Checks whether variables are constant, optionally within levels of another variable.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:isconstant} {varlist} [, {cmd:by}({varlist}) ]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt by(varlist)}}An optional list of grouping variables to check within.{p_end}

{marker description}{...}
{title:Description}

{pstd} Determines whether each variable in the provided {varlist} is
constant. If {opt by(varlist)} is specified, it checks whether the
variables are constant within each group defined by {opt by}.

{pstd} This can be used to determine whether, in a longitudinal
data-set stored in long format, higher level variables are constant
within each higher level group.

{marker examples}{...}
{title:Examples}

{phang2}{stata webuse bplong, clear:. webuse bplong, clear}{p_end}
{phang2}{stata isconstant sex agegrp bp:. isconstant sex agegrp bp}{p_end}
{phang2}{stata isconstant sex agegrp bp, by(patient):. isconstant sex agegrp bp, by(patient)}{p_end}