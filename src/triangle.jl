using QuadGK

@doc raw"""
    I(m1sq, m2sq, m3sq, p12sq, p13sq, p23sq)

the scalar three-point one-loop function evaluated using the Feynman parameters

```math
I(m_1^2, m_2^2, m_3^2, p_{12}^2, p_{13}^2, p_{23}^2)
= i \int \frac{d^4q}{(2\pi)^4} \frac{1} { (q^2-m_1^2 + iϵ)
[ (p_{12}-q)^2 -m_2^2 + iϵ][ (q-p_{13})^2-m_3^2+iϵ]}
```
The explicit expression can be found in the appendix of [arXiv:2001.05884](http://arxiv.org/abs/arXiv:2001.05884).

It is related to the LoopTools `C0` function by
`I(m1sq, m2sq, m3sq, p12sq, p13sq, p23sq) = -C0(p12sq, p13sq, p23sq, m2sq, m1sq, m3sq)/(16π^2)`.
see IC0(m1sq, m2sq, m3sq, p12sq, p13sq, p23sq)
"""
function I(m1sq, m2sq, m3sq, p12sq, p13sq, p23sq)
    @fastmath function integr(x)::Complex{Float64}
        b = 1 + ( x*(p12sq-p13sq-p23sq) + m3sq-m2sq )/p23sq
        c = ( x*(m1sq-m3sq) +m3sq-x*(1-x)*p13sq )/p23sq
        a = sqrt(4*c -b^2- sqrt(eps(Float64))*1im )
        (atan(b/a) - atan((b+2*x-2)/a) )/a
    end
    res = quadgk(integr, 0.0, 1.0)[1]
    res/p23sq /(8*π^2)
end

"""
    IC0(m1sq, m2sq, m3sq, p12sq, p13sq, p23sq)

I calculated using the LoopTools `C0`. For more information, see `I`.

It seems that the LoopTools integrals do not account for internal masses with a positive imaginary part.
"""
IC0(m1sq, m2sq, m3sq, p12sq, p13sq, p23sq) =  -C0(p12sq, p13sq, p23sq, m2sq, m1sq, m3sq)/(16π^2)
