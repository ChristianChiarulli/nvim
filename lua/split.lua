local function is_match_empty(pat, plain)
    return not not string.find("", pat, nil, plain)
end

--- String split into table
function string:split(sep, plain)
    local str = self
    local b, res = 0, {}
    sep = sep or "%s+"

    assert(type(sep) == "string")
    assert(type(str) == "string")

    if #sep == 0 then
        for i = 1, #str do
            res[#res + 1] = string.sub(str, i, i)
        end
        return res
    end

    assert(not is_match_empty(sep, plain), "delimiter can not match empty string")

    while b <= #str do
        local e, e2 = string.find(str, sep, b, plain)
        if e then
            res[#res + 1] = string.sub(str, b, e - 1)
            b = e2 + 1
            if b > #str then
                res[#res + 1] = ""
            end
        else
            res[#res + 1] = string.sub(str, b)
            break
        end
    end
    return res
end
