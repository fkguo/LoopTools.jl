# The 5-point one-loop integrals
const ee0 = 1; const ee1 = 4; const ee2 = 7; const ee3 = 10; const ee4 = 13;
const ee00 = 16; const ee11 = 19; const ee12 = 22; const ee13 = 25; const ee14 = 28;
const ee22 = 31; const ee23 = 34; const ee24 = 37; const ee33 = 40; const ee34 = 43;
const ee44 = 46; const ee001 = 49; const ee002 = 52; const ee003 = 55; const ee004 = 58;
const ee111 = 61; const ee112 = 64; const ee113 = 67; const ee114 = 70; const ee122 = 73;
const ee123 = 76; const ee124 = 79; const ee133 = 82; const ee134 = 85; const ee144 = 88;
const ee222 = 91; const ee223 = 94; const ee224 = 97; const ee233 = 100; const ee234 = 103;
const ee244 = 106; const ee333 = 109; const ee334 = 112; const ee344 = 115; const ee444 = 118;
const ee0000 = 121; const ee0011 = 124; const ee0012 = 127; const ee0013 = 130;
const ee0014 = 133; const ee0022 = 136; const ee0023 = 139; const ee0024 = 142;
const ee0033 = 145; const ee0034 = 148; const ee0044 = 151; const ee1111 = 154;
const ee1112 = 157; const ee1113 = 160; const ee1114 = 163; const ee1122 = 166;
const ee1123 = 169; const ee1124 = 172; const ee1133 = 175; const ee1134 = 178;
const ee1144 = 181; const ee1222 = 184; const ee1223 = 187; const ee1224 = 190;
const ee1233 = 193; const ee1234 = 196; const ee1244 = 199; const ee1333 = 202;
const ee1334 = 205; const ee1344 = 208; const ee1444 = 211; const ee2222 = 214;
const ee2223 = 217; const ee2224 = 220; const ee2233 = 223; const ee2234 = 226;
const ee2244 = 229; const ee2333 = 232; const ee2334 = 235; const ee2344 = 238;
const ee2444 = 241; const ee3333 = 244; const ee3334 = 247; const ee3344 = 250;
const ee3444 = 253; const ee4444 = 256

const ecoef = (:ee0, :ee1, :ee2, :ee3, :ee4, :ee00, :ee11, :ee12, :ee13, :ee14,
    :ee22, :ee23, :ee24, :ee33, :ee34, :ee44, :ee001, :ee002, :ee003, :ee004,
    :ee111, :ee112, :ee113, :ee114, :ee122, :ee123, :ee124, :ee133, :ee134, :ee144,
    :ee222, :ee223, :ee224, :ee233, :ee234, :ee244, :ee333, :ee334, :ee344, :ee444,
    :ee0000, :ee0011, :ee0012, :ee0013, :ee0014, :ee0022, :ee0023, :ee0024,
    :ee0033, :ee0034, :ee0044, :ee1111, :ee1112, :ee1113, :ee1114, :ee1122,
    :ee1123, :ee1124, :ee1133, :ee1134, :ee1144, :ee1222, :ee1223, :ee1224,
    :ee1233, :ee1234, :ee1244, :ee1333, :ee1334, :ee1344, :ee1444, :ee2222,
    :ee2223, :ee2224, :ee2233, :ee2234, :ee2244, :ee2333, :ee2334, :ee2344,
    :ee2444, :ee3333, :ee3334, :ee3344, :ee3444, :ee4444 )


@doc raw"""
    E0i(id, p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, 
    (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)

five-point tensor coefficient for `id`

```math
\begin{aligned}
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int d^D q &
\frac{({\rm numerator}) }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]} \\
&\times \frac1{\left[(q+p_1+p_2+p_3+p_4)^2-m_5^2\right]}
 \end{aligned}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `ee0` |`1` | scalar five-point one-loop function |
| `ee1` | `4` | coefficient of ``k_{1μ}`` |
| `ee2` | `7` | coefficient of ``k_{2μ}`` |
| `ee3` | `10` | coefficient of ``k_{3μ}`` |
| `ee00` | `13` | coefficient of ``g_{μν}`` |
| `...` | `...` |  `...` |
| `ee4444` | `256` | coefficient of ``k_{4μ} k_{4ν} k_{4ρ} k_{4σ}`` |

where $k_{1,2,3,4}$ are related to the external momenta $p_{1,2,3,4}$ by 
``k_{j} = \sum_{i=1}^j p_i``.
"""
function E0i(id, p1sq::Real, p2sq::Real, p3sq::Real, p4sq::Real, p5sq::Real, p12sq::Real,
        p23sq::Real, p34sq::Real, p45sq::Real, p51sq::Real, m1sq::Real, m2sq::Real,
        m3sq::Real, m4sq::Real, m5sq::Real)
    ccall((:e0i_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}),
         id,         p1sq,   p2sq,    p3sq,   p4sq,  p5sq,   p12sq,  p23sq,
             p34sq,  p45sq,  p51sq,  m1sq,   m2sq,   m3sq,   m4sq,   m5sq)
end

function E0i(id, p1sq, p2sq, p3sq, p4sq, p5sq, p12sq, p23sq, p34sq, p45sq, p51sq,
                 m1sq, m2sq, m3sq, m4sq, m5sq)
    ccall((:e0ic_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64},
                     Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64},
                     Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}),
        id, p1sq, p2sq, p3sq, p4sq, p5sq, p12sq, p23sq, p34sq, p45sq, p51sq, m1sq, m2sq, m3sq, m4sq, m5sq)
end



@doc raw"""
    E0(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, 
    (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)

the scalar five-point one-loop function

```math
\begin{aligned}
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int d^D q &
\frac{1  }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]} \\
&\times \frac1{\left[(q+p_1+p_2+p_3+p_4)^2-m_5^2\right]}
\end{aligned}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.
"""
E0(p1sq, p2sq, p3sq, p4sq, p5sq, p12sq, p23sq, p34sq, p45sq, p51sq, m1sq, m2sq,
  m3sq, m4sq, m5sq) = E0i(ee0, p1sq, p2sq, p3sq, p4sq, p5sq, p12sq, p23sq, p34sq,
  p45sq, p51sq, m1sq, m2sq, m3sq, m4sq, m5sq)

  
"""
    Eget(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, 
    (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2; val_only = false)

return the finite piece of all five-point coefficients.
See also [`eget`](@ref).
* `val_only = false`, return a `NamedTuple`; otherwise return an `NTuple`.
""" Eget

@doc raw"""
    eget(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, 
    (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)

return all five-point coefficients; each one is characterized by three numbers, 
with the later two coefficients of ``ε^{-1}`` and ``ε^{-2}``, respectively.
See also [`Eget`](@ref) and [`egetsym`](@ref).
""" eget

@doc raw"""
    eput!(res::Vector{ComplexF64}, p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, 
    (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)

return all five-point coefficients to the preallocated array `res` of length 258.

See also [`eget`](@ref) and [`egetsym`](@ref).
""" eput!


_define_get('E', 15, 86)

# for all real args, if using the one from _defince_get, julia would crash; 
# this does not happen for other cases, don't know why
# _Eres_ defined via _define_get; 
function eget(p1sq::Real, p2sq::Real, p3sq::Real, p4sq::Real, p5sq::Real, p12sq::Real,
        p23sq::Real, p34sq::Real, p45sq::Real, p51sq::Real, m1sq::Real, m2sq::Real,
        m3sq::Real, m4sq::Real, m5sq::Real) 
    ccall((:eput_, libooptools), Cvoid,  
        (Ptr{Vector{ComplexF64}}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Csize_t),
        _Eres_, p1sq, p2sq, p3sq, p4sq, p5sq, p12sq, p23sq, p34sq, p45sq, p51sq,
        m1sq, m2sq, m3sq, m4sq, m5sq, 258)
    _Eres_
end

# Egetnocache
let _str_ = join(["E0i($i, p1,p2,p3,p4,p5,p12,p23,p34,p45,p51,m1,m2,m3,m4,m5)," for i in ecoef])
    Meta.parse(string("Egetnocache(p1,p2,p3,p4,p5,p12,p23,p34,p45,p51,m1,m2,m3,m4,m5) = NamedTuple{ecoef}((", 
               _str_[1:end-1], "))") ) |> eval 
end
