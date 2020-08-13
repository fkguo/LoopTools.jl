
# Example

![triangle](triangle.png)

Let us compute the 3-point loop integral:
```math
C\left(p_1^2, p_2^2, (p_1+p_2)^2, m_1^2, m_2^2, m_3^2 \right)
```
with some hadron masses as input.

Tensor-coefficients:
```@example 1
using LoopTools
using PrettyPrinting

Cget(1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2 ) |> pprint
```

Scalar integral:
```@example 1
C0i(cc0, 1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2)
```

Writing out the ``\varepsilon^{-1}`` (corresponding to `DR1eps` in the `Mathematica` version), explicitly
```@example 1
cgetsym(1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2 ) |> pprint
```

Real and imaginary parts of the scalar integral:
```@example 1
using Plots

c0(x) = -C0(1.87^2, x^2, 5.28^2, (4.36-0.05im)^2, 2.01^2, 0.89^2 )

plot(2.5:0.001:3.4, x-> real(c0(x)), label="Re" )
plot!(2.5:0.001:3.4, x-> imag(c0(x)), label="Im" )
```