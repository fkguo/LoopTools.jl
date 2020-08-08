# Three-point functions

## `C0i(id, p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)`

three-point tensor coefficient for `id`

<!-- ```math -->
$$
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
$$
<!-- ``` -->

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `cc0` |`1` | scalar three-point one-loop function |
| `cc1` | `4` | coefficient of $p_{1\mu}$ |
| `cc2` | `7` | coefficient of $p_{2\mu}$ |
| `cc00` | `10` | coefficient of $g_{\mu\nu}$ |
| `cc11` | `13` | coefficient of $p_{1\mu} p_{1\nu}$ |
| `cc12` | `16` | coefficient of $p_{1\mu} p_{2\nu}$ |
| `cc22` | `19` | coefficient of $p_{2\mu} p_{2\nu}$ |
| `...` | `...` |  `...` |
| `cc2222` | `64` | coefficient of $p_{2\mu} p_{2\nu} p_{2\rho} p_{2\sigma}$ |

## `C0(p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)`

the scalar three-point one-loop function

<!-- ```math -->
$$
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p_1)^2-m_2^2\right]
\left[(q+p_1+p_2)^2-m_3^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
$$
<!-- ``` -->