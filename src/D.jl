# The 4-point one-loop integrals
const dd0 = 1; const dd1 = 4; const dd2 = 7; const dd3 = 10;
const dd00 = 13; const dd11 = 16; const dd12 = 19; const dd13 = 22; const dd22 = 25; const dd23 = 28;
const dd33 = 31; const dd001 = 34; const dd002 = 37;
const dd003 = 40; const dd111 = 43; const dd112 = 46; const dd113 = 49;
const dd122 = 52; const dd123 = 55; const dd133 = 58;
const dd222 = 61; const dd223 = 64; const dd233 = 67;
const dd333 = 70; const dd0000 = 73; const dd0011 = 76; const dd0012 = 79;
const dd0013 = 82; const dd0022 = 85; const dd0023 = 88;
const dd0033 = 91; const dd1111 = 94; const dd1112 = 97;
const dd1113 = 100; const dd1122 = 103; const dd1123 = 106; const dd1133 = 109;
const dd1222 = 112; const dd1223 = 115; const dd1233 = 118;
const dd1333 = 121; const dd2222 = 124; const dd2223 = 127;
const dd2233 = 130; const dd2333 = 133; const dd3333 = 136; const dd00001 = 139;
const dd00002 = 142; const dd00003 = 145; const dd00111 = 148;
const dd00112 = 151; const dd00113 = 154; const dd00122 = 157;
const dd00123 = 160; const dd00133 = 163; const dd00222 = 166; const dd00223 = 169;
const dd00233 = 172; const dd00333 = 175; const dd11111 = 178;
const dd11112 = 181; const dd11113 = 184; const dd11122 = 187;
const dd11123 = 190; const dd11133 = 193; const dd11222 = 196; const dd11223 = 199;
const dd11233 = 202; const dd11333 = 205; const dd12222 = 208;
const dd12223 = 211; const dd12233 = 214; const dd12333 = 217;
const dd13333 = 220; const dd22222 = 223; const dd22223 = 226; const dd22233 = 229;
const dd22333 = 232; const dd23333 = 235; const dd33333 = 238

@doc raw"""
    D0i(id, p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)

four-point tensor coefficient for `id`

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `dd0` |`1` | scalar four-point one-loop function |
| `dd1` | `4` | coefficient of ``p_{1μ}`` |
| `dd2` | `7` | coefficient of ``p_{2μ}`` |
| `dd3` | `10` | coefficient of ``p_{3μ}`` |
| `dd00` | `13` | coefficient of ``g_{μν}`` |
| `...` | `...` |  `...` |
| `dd33333` | `238` | coefficient of ``p_{3μ} p_{3ν} p_{3ρ} p_{3σ} p_{3λ}`` |
"""
function D0i(id, p1sq::Real, p2sq::Real, p3sq::Real, p4sq::Real, p12sq::Real, p23sq::Real,
                 m1sq::Real, m2sq::Real, m3sq::Real, m4sq::Real)
    ccall((:d0i_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}),
         id,         p1sq,   p2sq,    p3sq,   p4sq,   p12sq,  p23sq,  m1sq,   m2sq,   m3sq,   m4sq)
end

function D0i(id, p1sq, p2sq, p3sq, p4sq, p12sq, p23sq, m1sq, m2sq, m3sq, m4sq)
    ccall((:d0ic_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64},
                     Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}),
         id,         p1sq,   p2sq,    p3sq,   p4sq,   p12sq,  p23sq,  m1sq,   m2sq,   m3sq,   m4sq)
end
#
# function D0i(id, xpi::Vector{T}, xmi::Vector{T}) where T<:Real
#     ccall((:ltd0i2_, libooptools), ComplexF64,
#         (Ref{Int64}, Ref{Float64}, Ref{Float64}),
#          id,         xpi,  xmi)
# end
#
# function D0i(id, xpi::Vector, xmi::Vector)
#     ccall((:ltd0ic2_, libooptools), ComplexF64,
#         (Ref{Int64}, Ref{ComplexF64}, Ref{ComplexF64}),
#          id,         complex.(xpi),  xmi)
# end


@doc raw"""
    D0(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)

the scalar four-point one-loop function

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.
"""
D0(p1sq, p2sq, p3sq, p4sq, p12sq, p23sq, m1sq, m2sq, m3sq, m4sq) = D0i(dd0,
    p1sq, p2sq, p3sq, p4sq, p12sq, p23sq, m1sq, m2sq, m3sq, m4sq)
# D0(xpi::Vector, xmi::Vector) = D0i(dd0, xpi, xmi)
# D0(xpi::Vector, xpij::Vector, xmi::Vector) = D0(vcat(xpi, xpij), xmi)
