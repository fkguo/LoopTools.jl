
# E functions have 15 arguments, this list is sufficient
const _for_args = "a,b,c,d,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t"

# internal function, to define the Lget and lget functions
# L: 'A', 'B', 'C', 'D', 'E' for 1 to 5 point integrals
# args: the arguments of these integrals
# narg: No. of arguments;            1 for A,  3 for B,  6 for C, 10 for D, 15 for E
# ncoef: No. of tensor coefficients; 2 for A, 11 for B, 22 for C, 80 for D, 86 for E
function _define_get(L, narg::Int, ncoef::Int)
    _args = _for_args[1:(2narg-1)]
    _size = 3ncoef
    _l = lowercase(L)
    _str_ = join(["Ref{ComplexF64}," for _ in 1:narg])
    _str2_ = join(["_a[$(3i-2)]," for i in 1:ncoef])

    # define lget functions
    Meta.parse(
        string("const _$(L)res_ = Vector{ComplexF64}(undef, $(_size));",
            "function $(_l)get($(_args));",
            "ccall((:$(_l)putc_, libooptools), Cvoid,", 
            "(Ptr{Vector{ComplexF64}},", _str_, "Csize_t),",
            "_$(L)res_,", _args, ", $(_size) ); _$(L)res_; end")
    ) |> eval

    # define Lget functions
    Meta.parse(
        string("function $(L)get($(_args));",
        "_a = $(_l)get($(_args));", 
        "NamedTuple{$(_l)coef}((", _str2_[1:end-1], ")); end" )
    ) |> eval
end




# prototype; much shorter using metaprogramming as above
# function Bget(psq, m1sq, m2sq)
#     NamedTuple{bcoef}(
#         (B0i(bb0, psq, m1sq, m2sq), B0i(bb1, psq, m1sq, m2sq), B0i(bb00, psq, m1sq, m2sq), 
#         B0i(bb11, psq, m1sq, m2sq), B0i(bb001, psq, m1sq, m2sq), B0i(bb111, psq, m1sq, m2sq), 
#         B0i(dbb0, psq, m1sq, m2sq), B0i(dbb1, psq, m1sq, m2sq), B0i(dbb00, psq, m1sq, m2sq), 
#         B0i(dbb11, psq, m1sq, m2sq), B0i(dbb001, psq, m1sq, m2sq) ) 
#     )
# end
