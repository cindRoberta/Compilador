@enum TokenKind begin
    Ident
    LiteralInt
end

struct Token
    kind::TokenKind
    i_start::Int
    i_end::Int
end

pos = 1

function tokenizer(chars::String)::Token
    #c::Char = 'a'
    #pos = 1
    tkn_start = pos
    println(pos)

    while !(chars[pos] |> isspace) && pos < length(chars)
        #c = chars[pos]
        global pos += 1
    end

    println(pos)
    #tkn_end = if pos == length(chars); pos else pos - 2 end
    tkn_end = if pos == length(chars); pos else pos - 1 end

    global pos += 1

    if isa(tryparse(Float64, chars[tkn_start:tkn_end]), Number)
        return Token(LiteralInt, tkn_start, tkn_end)
    else
        return Token(Ident, tkn_start, tkn_end)
    end
end

# 30 => 1:2
# 1º space => 3
# abc => 4:6
# 2º space => 7
# def => 8:10
t = tokenizer("30 abc def")
println(t)
s = tokenizer("30 abc def")
println(s)
r = tokenizer("30 abc def")
println(r)
