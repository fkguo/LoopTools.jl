# The 3-point one-loop integrals
const cc0 = 1; const cc1 = 4; const cc2 = 7;
const cc00 = 10; const cc11 = 13; const cc12 = 16; const cc22 = 19;
const cc001 = 22; const cc002 = 25; const cc111 = 28; const cc112 = 31; const cc122 = 34; const cc222 = 37;
const cc0000 = 40; const cc0011 = 43; const cc0012 = 46; const cc0022 = 49;
const cc1111 = 52; const cc1112 = 55; const cc1122 = 58; const cc1222 = 61; const cc2222 = 64

const ccof = (:cc0, :cc1, :cc2, :cc00, :cc11, :cc12, :cc22, :cc001, :cc002, :cc111, 
              :cc112, :cc122, :cc222, :cc0000, :cc0011, :cc0012, :cc0022, :cc1111, 
              :cc1112, :cc1122, :cc1222, :cc2222)

@doc raw"""
    C0i(id, p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)

three-point tensor coefficient for `id`

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right]}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `cc0` |`1` | scalar three-point one-loop function |
| `cc1` | `4` | coefficient of ``p_{1μ}`` |
| `cc2` | `7` | coefficient of ``p_{2μ}`` |
| `cc00` | `10` | coefficient of ``g_{μν}`` |
| `cc11` | `13` | coefficient of ``p_{1μ} p_{1ν}`` |
| `cc12` | `16` | coefficient of ``p_{1μ} p_{2ν}`` |
| `cc22` | `19` | coefficient of ``p_{2μ} p_{2ν}`` |
| `...` | `...` |  `...` |
| `cc2222` | `64` | coefficient of ``p_{2μ} p_{2ν} p_{2ρ} p_{2σ}`` |
"""
function C0i(id, p1sq::Real, p2sq::Real, p3sq::Real, m1sq::Real, m2sq::Real, m3sq::Real)
    ccall((:c0i_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, 
        Ref{Float64}, Ref{Float64}),
        id, p1sq, p2sq, p3sq, m1sq, m2sq, m3sq)
end

function C0i(id, p1sq, p2sq, p3sq, m1sq, m2sq, m3sq)
    ccall((:c0ic_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, 
        Ref{ComplexF64}, Ref{ComplexF64}),
        id, p1sq, p2sq, p3sq, m1sq, m2sq, m3sq)
end


@doc raw"""
    C0(p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)

the scalar three-point one-loop function

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right]}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.
"""
function C0(p1sq::Real, p2sq::Real, p3sq::Real, m1sq::Real, m2sq::Real, m3sq::Real)
    ccall((:c0_, libooptools), ComplexF64,
        (Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}),
        p1sq, p2sq, p3sq, m1sq, m2sq, m3sq)
end
function C0(p1sq, p2sq, p3sq, m1sq, m2sq, m3sq)
    ccall((:c0c_, libooptools), ComplexF64,
        (Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}, 
        Ref{ComplexF64}, Ref{ComplexF64}),
        p1sq, p2sq, p3sq, m1sq, m2sq, m3sq)
end


"""
    Cget(p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)

return a `NamedTuple` of all three-point coefficients.
""" Cget
let _str_ = join(["C0i($i, p1,p2,p1p2,m1,m2,m3)," for i in ccof])
    Meta.parse(string("Cget(p1, p2, p1p2, m1, m2, m3) = NamedTuple{ccof}((", _str_[1:end-1], "))")) |> eval 
end
