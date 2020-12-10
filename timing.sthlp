{smcl}
{* *! version 0.0.2  10dec2020}{...}
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

{pstd} There are 100 timers which are accesible by {help timer}. By default,
{cmd:timing} will use the 99th timer. If you are already using that one, you can
use the {opt num} option to adjust that.

{pstd} To run a command multiple times and obtain a distribution of timing
information, you can combine {cmd:timing} with {help simulate}. {ul on}Note that
if using {cmd:timing} inside {cmd:simulate}, you CANNOT pass the {opt num}
option{ul off}. I'm uncertain of why this errors, but its easy to work around
(just don't use the 99th timer for anything besides {cmd:timing}.

{marker examples}{...}
{title:Examples}

{phang2}{stata sysuse auto, clear:. sysuse auto, clear}{p_end}
{phang2}{stata `"timing: logit foreign mpg"' :. timing: logit foreign mpg}{p_end}
{phang2}{stata `"timing, num(23): logit foreign mpg"' :. timing, num(23): logit foreign mpg}{p_end}

To obtain a distribution of timing, combine {cmd:timing} with {help simulate}:

{phang2}{stata `"simulate time=r(timing), reps(100): timing: logit foreign mpg"' :. simulate time=r(timing), reps(100): timing: logit foreign mpg}{p_end}
{phang2}{stata summarize time:. summarize time}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:timing} stores the following in {cmd:r()}:

{synoptset 23 tabbed}{...}
{p2col 5 23 26 2: Scalars}{p_end}
{synopt:{cmd:r(timing)}}value of the timer{p_end}
