# Two-point functions

## `B0i(id, p^2, m1^2, m2^2)`

two-point tensor coefficient for `id`

```math
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{({\rm numerator})\, d^D q }{(q^2-m_1^2)\left[(q+p)^2-m_2^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
```

Special cases:

| `id` | Int | Description |
|:---|:---:|:---|
| `bb0`   (`dbb0`) |`1` (`19`) | (derivative of) scalar two-point one-loop function |
| `bb1`   (`dbb1`) | `4` (`22`) | (derivative of) coefficient of ``p_{\mu}`` |
| `bb00`  (`dbb00`)  | `7` (`25`) | (derivative of) coefficient of ``g_{\mu\nu}`` |
| `bb11`  (`dbb11`)  | `10` (`28`) | (derivative of) coefficient of ``p_\mu p_\nu`` |
| `bb001` (`dbb001`)  | `13` (`31`) | (derivative of) coefficient of ``g_{\mu\nu}p_\rho`` |
| `bb111` | `16` | coefficient of ``p_\mu p_\nu p_\rho`` |


## `B0(p^2, m1^2, m2^2)`

the scalar two-point one-loop function

```math
\frac{\mu^{4-D}}{i\pi^{D/2} r_\Gamma} \int
\frac{d^D q }{(q^2-m_1^2)\left[(q+p)^2-m_2^2\right]}
\quad{\rm with}\quad r_\Gamma = \frac{\Gamma^2(1-\varepsilon)\Gamma(1+\varepsilon)}{\Gamma(1-2\varepsilon)},~D=4-2\varepsilon.
```
