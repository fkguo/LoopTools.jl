using SymbolicUtils: @syms, @rule, @acrule, _iszero, Chain, Postwalk

@syms ε::Real

_r1 = @rule ~x::_iszero / ~y => 0
_r2 = @acrule ~x::_iszero + ~y => ~y
_simplify = Postwalk(Chain([_r1, _r2, _r2]))

@doc raw"""
    DRResult(c0, c1, c2)

arrange the coefficients of ``1/ε``, corresponding to the `Mathematica` version of the same name.
`1/ε` corresponds to `DR1eps` in the `Mathematica` version.
"""
DRResult(c0, c1, c2) = _simplify(c0 + c1/ε + c2/ε^2)

function _round(x; kws...)
    imag(x) < sqrt(eps(1.0)) && (x = real(x))
    return round(x; kws...)
end


function _define_getsym(L, narg::Int, ncoef::Int)
    l = lowercase(L)
    _args = _for_args[1:(2narg-1)]

    Meta.parse(
        string("function $(l)getsym($(_args));",
        "_$(L)res = $(l)get($(_args));", 
        "_b = _round.(_$(L)res, digits=6);",
        "NamedTuple{$(l)coef}(DRResult(_b[3i-2], _b[3i-1], _b[3i]) for i = 1:$(ncoef));",
        "end" )
    ) |> eval
end

_define_getsym('A', 1, 2)
_define_getsym('B', 3, 11)
_define_getsym('C', 6, 22)
_define_getsym('D', 10, 80)
_define_getsym('E', 15, 86)


@doc raw"""
    agetsym(msq)

return all one-point coefficients with terms of ``ε^{-1}`` and ``ε^{-2}`` kept symbolically.
""" agetsym

@doc raw"""
    bgetsym(p^2, m1^2, m2^2)

return all two-point coefficients with terms of ``ε^{-1}`` and ``ε^{-2}`` kept symbolically.
""" bgetsym

@doc raw"""
    cgetsym(p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)

return all three-point coefficients with terms of ``ε^{-1}`` and ``ε^{-2}`` kept symbolically.
""" cgetsym

@doc raw"""
    dgetsym(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)

return all four-point coefficients with terms of ``ε^{-1}`` and ``ε^{-2}`` kept symbolically.
""" dgetsym

@doc raw"""
    egetsym(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, 
    (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)

return all five-point coefficients with terms of ``ε^{-1}`` and ``ε^{-2}`` kept symbolically.
""" egetsym