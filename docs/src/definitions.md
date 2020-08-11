# Definitions

Copied from the [`LoopTools` manual](https://github.com/fkguo/LoopTools.jl/blob/master/docs/LT215Guide.pdf).

## General one-loop integral

Consider a general one-loop integral shown as follows:

![momentum flow in in the loop](loop_general.png)

The tensor loop integral is defined as 

```math
T_{\mu_1\mu_2...\mu_P}^N =  \frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int d^D q
\frac{ q_{\mu_1}q_{\mu_2}...q_{\mu_P} }{(q^2-m_1^2)\left[(q+k_1)^2-m_2^2\right] \cdots
\left[(q+k_{N-1})^2-m_N^2\right]}
```

with ``r_\Gamma = \frac{\Gamma^2(1-\varepsilon) \Gamma(1+\varepsilon)}{\GammaΓ(1-2\varepsilon)}``, ``D=4-2\varepsilon``.

The momentum flow is shown in the figure. We have
```math
\begin{aligned}
& p_1 = k_1, \quad p_2 = k_2 - k_1, \quad \ldots, \quad p_N = k_N - k_{N-1}, \\
& k_1 = p_1, \quad k_2 = p_1 + p_2, \quad \ldots, \quad k_N = \sum_{i = 1}^N p_i .
\end{aligned}
```

## Tensor coefficients

The 1-point, 2-point, 3-point, 4-point and 5-point scalar loop integrals are denoted by `A0`, `B0`, `C0`, `D0` and `E0`, respectively.

The 1-loop tensor integral can be decomposed as
```math
\begin{aligned}
B_\mu & = k_{1\mu} B_1, \\
B_{\mu\nu} & = g_{\mu\nu} B_{00} + k_{1\mu} k_{1\nu} B_{11}, \\
C_\mu &= k_{1\mu} C_1 + k_{2\mu} C_2 \\
C_{\mu\nu} &= g_{\mu\nu} C_{00} + \sum_{i,j=1}^2 k_{i\mu}k_{j\nu} C_{ij}, \\
C_{\mu\nu\rho} &= \sum_{i=1}^2 \left(g_{\mu\nu}k_{i\rho} + g_{\nu\rho} k_{i\mu} + g_{\mu\rho} k_{i\nu} \right) C_{00i} + \sum_{i,j,\ell=1}^2 k_{i\mu}k_{j\nu}k_{\ell \rho} C_{ij\ell}, \\
D_\mu &= \sum_{i=1}^3 k_{i\mu} D_i ,\\
D_{\mu\nu} &= g_{\mu\nu} D_{00} + \sum_{i,j=1}^3 k_{i\mu}k_{j\nu} D_{ij}, \\
D_{\mu\nu\rho} &= \sum_{i=1}^3 \left(g_{\mu\nu}k_{i\rho} + g_{\nu\rho} k_{i\mu} + g_{\mu\rho} k_{i\nu} \right) D_{00i} + \sum_{i,j,\ell=1}^3 k_{i\mu}k_{j\nu}k_{\ell \rho} D_{ij\ell}, \\
D_{\mu\nu\rho\sigma} &= \left( g_{\mu\nu}g_{\rho\sigma} + g_{\mu\rho}g_{\nu\sigma} + g_{\mu\sigma}g_{\nu\rho} \right) D_{0000} + \sum_{i,j,\ell,m=1}^3 k_{i\mu}k_{j\nu}k_{\ell \rho}k_{m\sigma} D_{ij\ell m} \\
&\phantom{=} + \sum_{i,j=1}^3 \left(g_{\mu\nu}k_{i\rho}k_{j\sigma} + g_{\nu\rho} k_{i\mu}k_{j\sigma} + g_{\mu\rho} k_{i\nu}k_{j\sigma} 
+ g_{\mu\sigma}k_{i\nu}k_{j\rho} + g_{\nu\sigma}k_{i\mu}k_{j\rho} + g_{\rho\sigma}k_{i\mu}k_{j\nu} \right) D_{00ij} . \\
\end{aligned}
```

## Conventions for the momenta

Consider the triangle diagram:

![triangle](triangle.png)

The 3-point loop function can be written either in terms of the external momenta as
```math
C\left(p_1^2, p_2^2, (p_1+p_2)^2, m_1^2, m_2^2, m_3^2 \right),
```
or in terms of the momenta $k_i$ as
```math
C\left(k_1^2, (k_1-k_2)^2, k_2^2, m_1^2, m_2^2, m_3^2 \right).
```
The coefficients computed are the coefficients of the momenta $k_i$, e.g., $C_1$ and $C_{112}$ are the coefficients of $k_{1\mu}$ and $k_{1\mu}k_{1\nu}k_{2\rho}$, respectively.

## Examples

```@example 1
using LoopTools
using PrettyPrinting

Cget(1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2 ) |> pprint
```

```@example 1
C0i(cc0, 1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2)
```

```@example 1
using Plots

c0(x) = -C0(1.87^2, x^2, 5.28^2, (4.36-0.05im)^2, 2.01^2, 0.89^2 )

plot(2.5:0.001:3.4, x-> real(c0(x)), label="Re" )
plot!(2.5:0.001:3.4, x-> imag(c0(x)), label="Im" )
```