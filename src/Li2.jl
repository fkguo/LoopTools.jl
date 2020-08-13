@doc """
    Li2(x)

return the dilogarithm of ``x``.
"""
Li2(x) = ccall((:li2c_, libooptools), ComplexF64, (Ref{ComplexF64},), x)
Li2(x::Real) = ccall((:li2_, libooptools), ComplexF64, (Ref{Float64},), x)


@doc """
    Li2omx(x)

return the dilogarithm of ``1-x``.
"""
Li2omx(x) = ccall((:li2omxc_, libooptools), ComplexF64, (Ref{ComplexF64},), x)
Li2omx(x::Real) = ccall((:li2omx_, libooptools), ComplexF64, (Ref{Float64},), x)