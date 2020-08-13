# The 2-point one-loop integrals
const bb0 = 1; const bb1 = 4; const bb00 = 7
const bb11 = 10; const bb001 = 13; const bb111 = 16
const dbb0 = 19; const dbb1 = 22; const dbb00 = 25;
const dbb11 = 28; const dbb001 = 31

const bcoef = (:bb0, :bb1, :bb00, :bb11, :bb001, :bb111, :dbb0, :dbb1, 
              :dbb00, :dbb11, :dbb001)

@doc raw"""
    B0i(id, p^2, m1^2, m2^2)

two-point tensor coefficient for `id`

```math
\frac{μ^{4-D}}{iπ^{D/2} r_Γ} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p)^2-m_2^2\right]}
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `bb0`   (`dbb0`) |`1` (`19`) | (derivative of) scalar two-point one-loop function |
| `bb1`   (`dbb1`) | `4` (`22`) | (derivative of) coefficient of ``p_{μ}`` |
| `bb00`  (`dbb00`)  | `7` (`25`) | (derivative of) coefficient of ``g_{μν}`` |
| `bb11`  (`dbb11`)  | `10` (`28`) | (derivative of) coefficient of ``p_μ p_ν`` |
| `bb001` (`dbb001`)  | `13` (`31`) | (derivative of) coefficient of ``g_{μν}p_ρ`` |
| `bb111` | `16` | coefficient of ``p_μ p_ν p_ρ`` |

Functions `B0`, `B1`, `B00`, `B11`, `B001` and `B111` are defined.
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
```

with ``r_Γ = \frac{Γ^2(1-ε)Γ(1+ε)}{Γ(1-2ε)}``, ``D=4-2ε``.
""" B0

"Coefficients of two-point tensor loop integral. See `B0i`." B00, B11, B001, B111, DB0, DB1, DB00, DB11

for f in (:B0, :B1, :B00, :B11, :B001, :B111, :DB0, :DB1, :DB00, :DB11)
    ff = lowercase(string("$(f)_"))
    @eval function ($f)(psq::Real, m1sq::Real, m2sq::Real)
        ccall(($ff, libooptools), ComplexF64,
        (Ref{Float64}, Ref{Float64}, Ref{Float64}),
        psq, m1sq, m2sq)
    end
end

for f in (:B0, :B1, :B00, :B11, :B001, :B111, :DB0, :DB1, :DB00, :DB11)
    ff = lowercase(string("$(f)c_"))
    @eval function ($f)(psq, m1sq, m2sq)
        ccall(($ff, libooptools), ComplexF64,
        (Ref{ComplexF64}, Ref{ComplexF64}, Ref{ComplexF64}),
        psq, m1sq, m2sq)
    end
end


"""
    Bget(p^2, m1^2, m2^2; val_only = false)

return the finite piece of all two-point coefficients.
See also [`bget`](@ref).
* `val_only = false`, return a `NamedTuple`; otherwise return a `NTuple`.
""" Bget

@doc raw"""
    bget(p^2, m1^2, m2^2)

return all two-point coefficients; each one is characterized by three numbers, 
with the later two coefficients of ``ε^{-1}`` and ``ε^{-2}``, respectively.
See also [`Bget`](@ref) and [`bgetsym`](@ref).
""" bget

# define bget and Bget
_define_get('B', 3, 11)

function bget(p::Real, m1::Real, m2::Real) 
    ccall((:bput_, libooptools), Cvoid,  
        (Ptr{Vector{ComplexF64}}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Csize_t),
        _Bres_, p, m1, m2, 33)
    _Bres_
end

# Bgetnocache
let _str_ = join(["B0i($i, psq, m1sq, m2sq)," for i in bcoef])
    Meta.parse(string("Bgetnocache(psq, m1sq, m2sq) = NamedTuple{bcoef}((", _str_[1:end-1], "))")) |> eval 
end

