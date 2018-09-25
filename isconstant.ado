
set trace off
cap program drop isconstant
program isconstant
  syntax varlist(min=1) [, by(varlist)]
  preserve

  local constants
  local nonconstants

  tokenize `varlist'
  local i = 1
  while "``i''" != "" {
    local varname "``i''"

    if "`by'" != "" {
      capture bysort `by' (`varname') : assert (`varname' == `varname'[1]) | missing(`varname')
    }
    else {
      sort `varname'
      capture assert (`varname' == `varname'[1]) | missing(`varname')
    }
    if  _rc == 0 {
            local constants `constants' `varname'
    }
    else {
            local nonconstants `nonconstants' `varname'
    }
    local i = `i' + 1
  }
  if "`by'" != "" {
    di "Within each level of {it:`by'}:"
  }
  if "`constants'" != "" {
    di "Constant: {it:`constants'}"
  }
  if "`nonconstants'" != "" {
    di "Not constant: {it:`nonconstants'}"
  }
  restore
end

sysuse auto, clear
isconstant foreign mpg price, by(foreign )
