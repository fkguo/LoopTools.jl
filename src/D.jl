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

const dcoef = (:dd0, :dd1, :dd2, :dd3, :dd00, :dd11, :dd12, :dd13, :dd22, :dd23,
    :dd33, :dd001, :dd002, :dd003, :dd111, :dd112, :dd113, :dd122, :dd123, :dd133, 
    :dd222, :dd223, :dd233, :dd333, :dd0000, :dd0011, :dd0012, :dd0013, :dd0022,
    :dd0023, :dd0033, :dd1111, :dd1112, :dd1113, :dd1122, :dd1123, :dd1133, :dd1222, 
    :dd1223, :dd1233, :dd1333, :dd2222, :dd2223, :dd2233, :dd2333, :dd3333, :dd00001,
    :dd00002, :dd00003, :dd00111, :dd00112, :dd00113, :dd00122, 
    :dd00123, :dd00133, :dd00222, :dd00223, :dd00233, :dd00333, :dd11111,        
    :dd11112, :dd11113, :dd11122, :dd11123, :dd11133, :dd11222, :dd11223,
    :dd11233, :dd11333, :dd12222, :dd12223, :dd12233, :dd12333,        
    :dd13333, :dd22222, :dd22223, :dd22233, :dd22333, :dd23333, :dd33333)

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
| `dd1` | `4` | coefficient of ``k_{1μ}`` |
| `dd2` | `7` | coefficient of ``k_{2μ}`` |
| `dd3` | `10` | coefficient of ``k_{3μ}`` |
| `dd00` | `13` | coefficient of ``g_{μν}`` |
| `...` | `...` |  `...` |
| `dd33333` | `238` | coefficient of ``k_{3μ} k_{3ν} k_{3ρ} k_{3σ} k_{3λ}`` |

where $k_{1,2,3}$ are related to the external momenta $p_{1,2,3}$ by 
``k_{j} = \sum_{i=1}^j p_i``.
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



"""
    Dget(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, 
    m1^2, m2^2, m3^2, m4^2; val_only = false)

return the finite piece of all four-point coefficients.
See also [`dget`](@ref).
* `val_only = false`, return a `NamedTuple`; otherwise return a `NTuple`.
""" Dget

@doc raw"""
    dget(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)

return all four-point coefficients; each one is characterized by three numbers, 
with the later two coefficients of ``ε^{-1}`` and ``ε^{-2}``, respectively.
See also [`Dget`](@ref) and [`dgetsym`](@ref).
""" dget

_define_get('D', 10, 80)

function dget(p1sq::Real, p2sq::Real, p3sq::Real, p4sq::Real, p12sq::Real, p23sq::Real,
              m1sq::Real, m2sq::Real, m3sq::Real, m4sq::Real) 
    ccall((:dput_, libooptools), Cvoid,  
        (Ptr{Vector{ComplexF64}}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Csize_t),
        _Dres_, p1sq, p2sq, p3sq, p4sq, p12sq, p23sq, m1sq, m2sq, m3sq, m4sq, 240)
    _Dres_
end

# Dgetnocache
let _str_ = join(["D0i($i, p1,p2,p3,p4,p12,p23,m1,m2,m3,m4)," for i in dcoef])
    Meta.parse(string("Dgetnocache(p1,p2,p3,p4,p12,p23,m1,m2,m3,m4) = NamedTuple{dcoef}((", 
               _str_[1:end-1], "))") ) |> eval 
end