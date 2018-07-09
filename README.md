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

## Why "Kubla Khan"?

I was looking for something that was unlikely to conflict with real modules on SSC and because XanADO was too puntastic.
