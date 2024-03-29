# Kubla Khan

A collection of commands I use for personal work. Unless otherwise stated, all commands should only be assumed to run on the most recent Stata release.

## Installing

You can install the entire package directly with:

```
net install kublakhan, from("https://raw.githubusercontent.com/josherrickson/kublakhan/master")
```

This will allow `adoupdate` to check for updates and install them as needed.

## Commands

- `numlevels`: Returns the number of unique values in a variable. Similar to printing `r(r)` after a `levelsof` command, but quicker.
- `fencode`: Encodes string variables to numeric with labels, essentially allowing `encode, replace`.
- `isconstant`: Checks whether a variable is constant, optionally within each level of a grouping variable.
- `timing`: A prefix (e.g. called as `timing: command`) to produce timing benchmark information.
- `bvtable`: When a command (such as `nlcom`) retuns only `r(b)` and `r(V)` instead of `r(table)` (which includes p-value and CI), this will generate a matrix `table`.
- `standardize`: A direct command to mean-center and optionally scale multiple variables.

## Why "Kubla Khan"?

I was looking for something that was unlikely to conflict with real modules on SSC and because XanADO was too puntastic.
