
# The 1-point one-loop integrals
const aa0 = 1; const aa00 = 4

@doc raw"""
    A0i(id, m^2)

one-point tensor coefficient for `id`

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int d^D q \frac{\{1, g_{μν} \} }{q^2-m^2}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε```.

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `aa0` |`1` | scalar one-point one-loop function, i.e., `A0(m^2)` |
| `aa00` | `4` | coefficient of ``g_{μν}`` |

"""
function A0i end
# somehow here the returning type must be ComplexF64 is I use the original LoopTools_jll.
# otherwise there would be a EXCEPTION_ACCESS_VIOLATION to crash julia
function A0i(id, msq::Real)
    _a0i = ccall((:a0i_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{Float64}),
        id, msq)
    return real(_a0i)  # we know this must be real
end
A0i(id, msq::Complex) = ccall((:a0ic_, libooptools), ComplexF64,
    (Ref{Int64}, Ref{ComplexF64}),
     id, msq)



@doc raw"""
    A0(m^2)

the scalar one-point one-loop function

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int d^D q \frac{1}{q^2-m^2}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.
"""
A0(msq::Real) = A0i(aa0, msq)
# ccall((:a0_, libooptools), ComplexF64, (Ref{Float64},), msq)

A0(msq) = ccall((:a0c_, libooptools), ComplexF64,
        (Ref{ComplexF64},),
        msq)

A00(msq) = A0i(aa00, msq)

"""
    Aget(m^2)

all one-point tensor coefficients.
"""
Aget(msq) = NamedTuple{(:aa0, :aa00)}((A0i(aa0, msq), A0i(aa00, msq)) )
# in the fortran code, the type of aget is memindex (int*8)
# Aget(msq) = ccall((:aget_, libooptools), Int64, #Tuple{Float64,Float64}, 
#         (Ref{Float64}, ),
#         msq)


# # the following code somehow only returns the first element...
# function Aput!(res, msq) 
#     ccall((:aput_, libooptools), Cvoid, 
#         (Ptr{Vector{Float64}}, Ref{Float64}),
#         res, msq)
#     res
# end
