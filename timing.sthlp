{smcl}
{* *! version 0.0.1  10dec2020}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "fencode##syntax"}{...}
{viewerjumpto "Description" "timing##description"}{...}
{viewerjumpto "Options" "timing##options"}{...}
{viewerjumpto "Examples" "timing##examples"}{...}
{viewerjumpto "Stored results" "timing##results"}{...}
{title:Title}

{phang}
{bf:timing} {hline 2} Times a command, reporting the results


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:timing}
	[{cmd:,} {opt num(#)}]
	{cmd::} {it:command}

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt num(#)}}use the {it:#}th timer (99 default).{p_end}


{marker description}{...}
{title:Description}

{pstd} The {help timer} command allows recording the running time of the
{it:command} via a chain of commands {cmd:timer reset}, {cmd:timer on},
{cmd:timer off}, and {cmd:timer list}. This prefix automates this by producing
timing information with a simple prefix.

{marker examples}{...}
{title:Examples}

{phang2}{stata sysuse auto, clear:. sysuse auto, clear}{p_end}
{phang2}{stata `"timing: logit foreign mpg"' :. timing: logit foreign mpg}{p_end}
{phang2}{stata `"timing, num(23): logit foreign mpg"' :. timing, num(23): logit foreign mpg}{p_end}

{marker results}{...}
{title:Stored results}

{pstd}
{cmd:timing} stores the following in {cmd:r()}:

{synoptset 23 tabbed}{...}
{p2col 5 23 26 2: Scalars}{p_end}
{synopt:{cmd:r(t{it:#})}}value of the timer{p_end}
{synopt:{cmd:r(nt{it:#})}}number of times turned on and off (always 1){p_end}

{phang}The {it:#} corresponds to the option {opt num(#)}.{p_end}

{phang}In addition, anything the {it:command} stores in {cmd:r()} will remain.{p_end}
