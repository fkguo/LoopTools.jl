# Four-point functions

## `D0i(id, p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)`

four-point tensor coefficient for `id`

<!-- ``math -->
$$
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
$$
<!-- `` -->

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `dd0` |`1` | scalar four-point one-loop function |
| `dd1` | `4` | coefficient of $p_{1\mu}$ |
| `dd2` | `7` | coefficient of $p_{2\mu}$ |
| `dd3` | `10` | coefficient of $p_{3\mu}$ |
| `dd00` | `13` | coefficient of $g_{\mu\nu}$ |
| `...` | `...` |  `...` |
| `dd33333` | `238` | coefficient of $p_{3\mu} p_{3\nu} p_{3\rho} p_{3\sigma} p_{3\lambda}$ |

##  `D0(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)`

the scalar four-point one-loop function

<!-- ``math -->
$$
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right] \left[(q+p_1+p_2+p_3)^2-m_4^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
$$
<!-- `` -->

