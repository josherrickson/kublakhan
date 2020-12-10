program define timing, rclass
    capture _on_colon_parse `0'
    local command `"`s(after)'"'
    if _rc != 0 | `"`command'"' == "" {
        display "`timing` must be passed as a prefix:"
        exit
    }
    
    * Need to reset `0' before declaring syntax
    local 0 `"`s(before)'"'
    syntax [, num(integer 99)]
    
    timer clear `num'
    timer on `num'
    `command'
    timer off `num'
    quietly timer list `num'
    display "Command took " r(t`num') " seconds to run."
    return scalar timing = r(t`num')
end
