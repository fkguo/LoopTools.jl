var documenterSearchIndex = {"docs":
[{"location":"definitions/#Definitions","page":"Definitions","title":"Definitions","text":"","category":"section"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"Copied from the LoopTools manual.","category":"page"},{"location":"definitions/#General-one-loop-integral","page":"Definitions","title":"General one-loop integral","text":"","category":"section"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"Consider a general one-loop integral shown as follows:","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"(Image: momentum flow in in the loop)","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"The tensor loop integral is defined as ","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"T_mu_1mu_2mu_P^N =  fracmu^4-Dipi^D2 r_Gamma int d^D q\nfrac q_mu_1q_mu_2q_mu_P (q^2-m_1^2)left(q+k_1)^2-m_2^2right cdots\nleft(q+k_N-1)^2-m_N^2right","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"with r_Gamma = fracGamma^2(1-varepsilon) Gamma(1+varepsilon)GammaΓ(1-2varepsilon), D=4-2varepsilon.","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"The momentum flow is shown in the figure. We have","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"beginaligned\n p_1 = k_1 quad p_2 = k_2 - k_1 quad ldots quad p_N = k_N - k_N-1 \n k_1 = p_1 quad k_2 = p_1 + p_2 quad ldots quad k_N = sum_i = 1^N p_i \nendaligned","category":"page"},{"location":"definitions/#Tensor-coefficients","page":"Definitions","title":"Tensor coefficients","text":"","category":"section"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"The 1-point, 2-point, 3-point, 4-point and 5-point scalar loop integrals are denoted by A0, B0, C0, D0 and E0, respectively.","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"The 1-loop tensor integral can be decomposed as","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"beginaligned\nB_mu  = k_1mu B_1 \nB_munu  = g_munu B_00 + k_1mu k_1nu B_11 \nC_mu = k_1mu C_1 + k_2mu C_2 \nC_munu = g_munu C_00 + sum_ij=1^2 k_imuk_jnu C_ij \nC_munurho = sum_i=1^2 left(g_munuk_irho + g_nurho k_imu + g_murho k_inu right) C_00i + sum_ijell=1^2 k_imuk_jnuk_ell rho C_ijell \nD_mu = sum_i=1^3 k_imu D_i \nD_munu = g_munu D_00 + sum_ij=1^3 k_imuk_jnu D_ij \nD_munurho = sum_i=1^3 left(g_munuk_irho + g_nurho k_imu + g_murho k_inu right) D_00i + sum_ijell=1^3 k_imuk_jnuk_ell rho D_ijell \nD_munurhosigma = left( g_munug_rhosigma + g_murhog_nusigma + g_musigmag_nurho right) D_0000 + sum_ijellm=1^3 k_imuk_jnuk_ell rhok_msigma D_ijell m \nphantom= + sum_ij=1^3 left(g_munuk_irhok_jsigma + g_nurho k_imuk_jsigma + g_murho k_inuk_jsigma \n+ g_musigmak_inuk_jrho + g_nusigmak_imuk_jrho + g_rhosigmak_imuk_jnu right) D_00ij  \nendaligned","category":"page"},{"location":"definitions/#Conventions-for-the-momenta","page":"Definitions","title":"Conventions for the momenta","text":"","category":"section"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"Consider the triangle diagram:","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"(Image: triangle)","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"The 3-point loop function can be written either in terms of the external momenta as","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"Cleft(p_1^2 p_2^2 (p_1+p_2)^2 m_1^2 m_2^2 m_3^2 right)","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"or in terms of the momenta k_i as","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"Cleft(k_1^2 (k_1-k_2)^2 k_2^2 m_1^2 m_2^2 m_3^2 right)","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"The coefficients computed are the coefficients of the momenta k_i, e.g., C_1 and C_112 are the coefficients of k_1mu and k_1muk_1nuk_2rho, respectively.","category":"page"},{"location":"definitions/#Examples","page":"Definitions","title":"Examples","text":"","category":"section"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"using LoopTools\nusing PrettyPrinting\n\nCget(1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2 ) |> pprint","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"C0i(cc0, 1.87^2, 2.9^2, 5.28^2, 4.36^2, 2.01^2, 0.89^2)","category":"page"},{"location":"definitions/","page":"Definitions","title":"Definitions","text":"using Plots\n\nc0(x) = -C0(1.87^2, x^2, 5.28^2, (4.36-0.05im)^2, 2.01^2, 0.89^2 )\n\nplot(2.5:0.001:3.4, x-> real(c0(x)), label=\"Re\" )\nplot!(2.5:0.001:3.4, x-> imag(c0(x)), label=\"Im\" )","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = LoopTools","category":"page"},{"location":"#LoopTools.jl","page":"Home","title":"LoopTools.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"For more information about the loop integrals, see the LoopTools manual. ","category":"page"},{"location":"","page":"Home","title":"Home","text":"The LoopTools Visitor Center","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [LoopTools]","category":"page"},{"location":"#LoopTools.A0-Tuple{Real}","page":"Home","title":"LoopTools.A0","text":"A0(m^2)\n\nthe scalar one-point one-loop function\n\nfracμ^4-Diπ^D2 r_Γ int d^D q frac1q^2-m^2\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.A0i","page":"Home","title":"LoopTools.A0i","text":"A0i(id, m^2)\n\none-point tensor coefficient for id\n\nfracμ^4-Diπ^D2 r_Γ int d^D q frac1 g_μν  q^2-m^2\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε`.\n\nSpecial cases:\n\nid Int Description\naa0 1 scalar one-point one-loop function, i.e., A0(m^2)\naa00 4 coefficient of g_μν\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.Aget-Tuple{Any}","page":"Home","title":"LoopTools.Aget","text":"Aget(m^2)\n\nall one-point tensor coefficients.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.B0","page":"Home","title":"LoopTools.B0","text":"B0(p^2, m1^2, m2^2)\n\nthe scalar two-point one-loop function\n\nfracμ^4-Diπ^D2 r_Γ int\nfracd^D q (q^2-m_1^2)left(q+p)^2-m_2^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.B00","page":"Home","title":"LoopTools.B00","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.B001","page":"Home","title":"LoopTools.B001","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.B0i-Tuple{Any,Real,Real,Real}","page":"Home","title":"LoopTools.B0i","text":"B0i(id, p^2, m1^2, m2^2)\n\ntwo-point tensor coefficient for id\n\nfracμ^4-Diπ^D2 r_Γ int\nfrac(rm numerator) d^D q (q^2-m_1^2)left(q+p)^2-m_2^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\nSpecial cases:\n\nid Int Description\nbb0   (dbb0) 1 (19) (derivative of) scalar two-point one-loop function\nbb1   (dbb1) 4 (22) (derivative of) coefficient of p_μ\nbb00  (dbb00) 7 (25) (derivative of) coefficient of g_μν\nbb11  (dbb11) 10 (28) (derivative of) coefficient of p_μ p_ν\nbb001 (dbb001) 13 (31) (derivative of) coefficient of g_μνp_ρ\nbb111 16 coefficient of p_μ p_ν p_ρ\n\nFunctions B0, B1, B00, B11, B001 and B111 are defined.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.B11","page":"Home","title":"LoopTools.B11","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.B111","page":"Home","title":"LoopTools.B111","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.Bget","page":"Home","title":"LoopTools.Bget","text":"Bget(psq, m1sq, m2sq)\n\nreturn a NamedTuple of all two-point coefficients.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.C0-NTuple{6,Real}","page":"Home","title":"LoopTools.C0","text":"C0(p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)\n\nthe scalar three-point one-loop function\n\nfracμ^4-Diπ^D2 r_Γ int\nfracd^D q (q^2-m_1^2)left(q+p_1)^2-m_2^2right\nleft(q+p_1+p_2)^2-m_3^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.C0i-Tuple{Any,Real,Real,Real,Real,Real,Real}","page":"Home","title":"LoopTools.C0i","text":"C0i(id, p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)\n\nthree-point tensor coefficient for id\n\nfracμ^4-Diπ^D2 r_Γ int\nfrac(rm numerator) d^D q (q^2-m_1^2)left(q+p_1)^2-m_2^2right\nleft(q+p_1+p_2)^2-m_3^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\nSpecial cases:\n\nid Int Description\ncc0 1 scalar three-point one-loop function\ncc1 4 coefficient of p_1μ\ncc2 7 coefficient of p_2μ\ncc00 10 coefficient of g_μν\ncc11 13 coefficient of p_1μ p_1ν\ncc12 16 coefficient of p_1μ p_2ν\ncc22 19 coefficient of p_2μ p_2ν\n... ... ...\ncc2222 64 coefficient of p_2μ p_2ν p_2ρ p_2σ\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.Cget","page":"Home","title":"LoopTools.Cget","text":"Cget(p1^2, p2^2, (p1+p2)^2, m1^2, m2^2, m3^2)\n\nreturn a NamedTuple of all three-point coefficients.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.D0-NTuple{10,Any}","page":"Home","title":"LoopTools.D0","text":"D0(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)\n\nthe scalar four-point one-loop function\n\nfracμ^4-Diπ^D2 r_Γ int\nfracd^D q (q^2-m_1^2)left(q+p_1)^2-m_2^2right\nleft(q+p_1+p_2)^2-m_3^2right left(q+p_1+p_2+p_3)^2-m_4^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.D0i-Tuple{Any,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real}","page":"Home","title":"LoopTools.D0i","text":"D0i(id, p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)\n\nfour-point tensor coefficient for id\n\nfracμ^4-Diπ^D2 r_Γ int\nfrac(rm numerator) d^D q (q^2-m_1^2)left(q+p_1)^2-m_2^2right\nleft(q+p_1+p_2)^2-m_3^2right left(q+p_1+p_2+p_3)^2-m_4^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\nSpecial cases:\n\nid Int Description\ndd0 1 scalar four-point one-loop function\ndd1 4 coefficient of p_1μ\ndd2 7 coefficient of p_2μ\ndd3 10 coefficient of p_3μ\ndd00 13 coefficient of g_μν\n... ... ...\ndd33333 238 coefficient of p_3μ p_3ν p_3ρ p_3σ p_3λ\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.DB0","page":"Home","title":"LoopTools.DB0","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.DB00","page":"Home","title":"LoopTools.DB00","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.DB1","page":"Home","title":"LoopTools.DB1","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.DB11","page":"Home","title":"LoopTools.DB11","text":"Coefficients of two-point tensor loop integral. See B0i.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.Dget","page":"Home","title":"LoopTools.Dget","text":"Dget(p1^2, p2^2, p3^2, p4^2, (p1+p2)^2, (p2+p3)^2, m1^2, m2^2, m3^2, m4^2)\n\nreturn a NamedTuple of all four-point coefficients.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.E0-NTuple{15,Any}","page":"Home","title":"LoopTools.E0","text":"E0(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)\n\nthe scalar five-point one-loop function\n\nfracμ^4-Diπ^D2 r_Γ int\nfracd^D q (q^2-m_1^2)left(q+p_1)^2-m_2^2right\nleft(q+p_1+p_2)^2-m_3^2right left(q+p_1+p_2+p_3)^2-m_4^2right\nleft(q+p_1+p_2+p_3+p_4)^2-m_5^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.E0i-Tuple{Any,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real,Real}","page":"Home","title":"LoopTools.E0i","text":"E0i(id, p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)\n\nfive-point tensor coefficient for id\n\nfracμ^4-Diπ^D2 r_Γ int\nfrac(rm numerator) d^D q (q^2-m_1^2)left(q+p_1)^2-m_2^2right\nleft(q+p_1+p_2)^2-m_3^2right left(q+p_1+p_2+p_3)^2-m_4^2right\n left(q+p_1+p_2+p_3+p_4)^2-m_5^2right\n\nwith r_Γ = fracΓ^2(1-ε)Γ(1+ε)Γ(1-2ε), D=4-2ε.\n\nSpecial cases:\n\nid Int Description\nee0 1 scalar five-point one-loop function\nee1 4 coefficient of p_1μ\nee2 7 coefficient of p_2μ\nee3 10 coefficient of p_3μ\nee00 13 coefficient of g_μν\n... ... ...\nee4444 256 coefficient of p_4μ p_4ν p_4ρ p_4σ\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.Eget","page":"Home","title":"LoopTools.Eget","text":"Eget(p1^2, p2^2, p3^2, p4^2, p5^2, (p1+p2)^2, (p2+p3)^2, (p3+p4)^2, (p4+p5)^2, (p5+p1)^2, m1^2, m2^2, m3^2, m4^2, m5^2)\n\nreturn a NamedTuple of all five-point coefficients.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.clearcache","page":"Home","title":"LoopTools.clearcache","text":"clearcache()\n\nremove all integrals from the cache.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.getcmpbits","page":"Home","title":"LoopTools.getcmpbits","text":"getcmpbits()\n\nthe number of bits for the cache-lookup precision. The default is 62 for double precision, 64 for quadruple precision.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.getdebugkey","page":"Home","title":"LoopTools.getdebugkey","text":"getdebugkey()\nsetdebugkey()\n\nDebugging output can be turned on.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.getdiffeps","page":"Home","title":"LoopTools.getdiffeps","text":"getdiffeps()\nsetdiffeps(b::Real)\n\nTwo quantities are tested for equality if the absolute value of their difference is smaller than getdiffoeps(). Default value: 10^-12.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.getmaxdev","page":"Home","title":"LoopTools.getmaxdev","text":"getmaxdev()\nsetmaxdev(b::Real)\n\nset the tolerance of the deviation between different implementations of functions.  The default value is 1e-12 for issuing warnings.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.getversionkey","page":"Home","title":"LoopTools.getversionkey","text":"getversionkey()\n\nreturn the version key; the loop integrals are implemented using different versions (Denner, FF). For more information, see Section 1.3.10 of the LoopTools manual.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.getzeroeps","page":"Home","title":"LoopTools.getzeroeps","text":"getzeroeps()\nsetzeroeps(b::Real)\n\nA given quantity x is tested to be zero if |x| is smaller than getzeroeps(). Default value: 10^-22.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.ltexi","page":"Home","title":"LoopTools.ltexi","text":"ltexi()\n\nsummary of errors.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.markcache","page":"Home","title":"LoopTools.markcache","text":"markcache()\n\nmark the current cache pointers.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.restorecache","page":"Home","title":"LoopTools.restorecache","text":"restorecache()\n\nrestore cache pointers marked by markcache().\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.setcmpbits","page":"Home","title":"LoopTools.setcmpbits","text":"setcmpbits(b::Int)\n\nset the number of bits for cache-lookup precision.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.setdebugkey","page":"Home","title":"LoopTools.setdebugkey","text":"getdebugkey()\nsetdebugkey()\n\nDebugging output can be turned on.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.setdebugrange-Tuple{Int64,Int64}","page":"Home","title":"LoopTools.setdebugrange","text":"setdebugrange(f::Int, t::Int)\n\nThe integrals are listed in the output with a unique serial number. If the list of integrals becomes too long, one can select only a range of serial numbers for viewing.\n\n\n\n\n\n","category":"method"},{"location":"#LoopTools.setdiffeps","page":"Home","title":"LoopTools.setdiffeps","text":"getdiffeps()\nsetdiffeps(b::Real)\n\nTwo quantities are tested for equality if the absolute value of their difference is smaller than getdiffoeps(). Default value: 10^-12.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.setmaxdev","page":"Home","title":"LoopTools.setmaxdev","text":"getmaxdev()\nsetmaxdev(b::Real)\n\nset the tolerance of the deviation between different implementations of functions.  The default value is 1e-12 for issuing warnings.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.setversionkey","page":"Home","title":"LoopTools.setversionkey","text":"setversionkey(k::Int)\n\nset the version key to choose the implementations of various functions and whether checking is performed.\n\n\n\n\n\n","category":"function"},{"location":"#LoopTools.setzeroeps","page":"Home","title":"LoopTools.setzeroeps","text":"getzeroeps()\nsetzeroeps(b::Real)\n\nA given quantity x is tested to be zero if |x| is smaller than getzeroeps(). Default value: 10^-22.\n\n\n\n\n\n","category":"function"}]
}
