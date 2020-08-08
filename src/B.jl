# The 2-point one-loop integrals
const bb0 = 1; const bb1 = 4; const bb00 = 7
const bb11 = 10; const bb001 = 13; const bb111 = 16
const dbb0 = 19; const dbb1 = 22; const dbb00 = 25;
const dbb11 = 28; const dbb001 = 31

@doc raw"""
    B0i(id, p^2, m1^2, m2^2)

two-point tensor coefficient for `id`

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p)^2-m_2^2\right]}
\quad{\rm with}\quad r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)},~D=4-2ε.
```

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `bb0`   (`dbb0`) |`1` (`19`) | (derivative of) scalar two-point one-loop function |
| `bb1`   (`dbb1`) | `4` (`22`) | (derivative of) coefficient of ``p_{μ}`` |
| `bb00`  (`dbb00`)  | `7` (`25`) | (derivative of) coefficient of ``g_{μν}`` |
| `bb11`  (`dbb11`)  | `10` (`28`) | (derivative of) coefficient of ``p_μ p_ν`` |
| `bb001` (`dbb001`)  | `13` (`31`) | (derivative of) coefficient of ``g_{μν}p_ρ`` |
| `bb111` | `16` | coefficient of ``p_μ p_ν p_ρ`` |
"""
function B0i(id, psq::Real, m1sq::Real, m2sq::Real)
    ccall((:b0i_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{Float64}, Ref{Float64}, Ref{Float64}),
        id, psq, m1sq, m2sq)
end

function B0i(id, psq, m1sq, m2sq)
    ccall((:b0ic_, libooptools), ComplexF64,
        (Ref{Int64}, Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}),
        id, psq, m1sq, m2sq)
end

@doc raw"""
    B0(p^2, m1^2, m2^2)

the scalar two-point one-loop function

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p)^2-m_2^2\right]}
\quad{\rm with}\quad r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)},~D=4-2ε.
```
"""
B0(xpi, m1sq, m2sq) = B0i(bb0, xpi, m1sq, m2sq)
# B0(xpi::Vector) = B0(xpi...)
# B0(xpi::Vector, xmi::Vector) = B0(xpi..., xmi...)
