program define timing
    capture _on_colon_parse `0'
    if _rc != 0 | `"`s(after)'"' == "" {
        display "`timing` must be passed as a prefix:"
        exit
    }
    _timing `0'
end

program define _timing
    _on_colon_parse `0'
    local command `"`s(after)'"'
    local 0 `"`s(before)'"'

    syntax [, num(integer 99)]
    timer clear `num'
    timer on `num'
    `command'
    timer off `num'
    quietly timer list `num'
    display "Command took " r(t`num') " seconds to run."
end