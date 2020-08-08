## Five-point functions

###  `E0i(id, p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)`

five-point tensor coefficient for `id`

```math
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]
 \left[(q+p_1+p_2+p_3+p_4)^2-m_5^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
```

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `ee0` |`1` | scalar five-point one-loop function |
| `ee1` | `4` | coefficient of ``p_{1\mu}`` |
| `ee2` | `7` | coefficient of ``p_{2\mu}`` |
| `ee3` | `10` | coefficient of ``p_{3\mu}`` |
| `ee00` | `13` | coefficient of ``g_{\muν}`` |
| ``\\cdots`` | ``\\cdots`` |  ``\\cdots`` |
| `ee4444` | `256` | coefficient of ``p_{4\mu} p_{4ν} p_{4ρ} p_{4σ}`` |


###  `E0(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)`

the scalar five-point one-loop function

```math
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]
\left[(q+p_1+p_2+p_3+p_4)^2-m_5^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
```
