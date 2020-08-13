for f in (:ltexi, :clearcache, :markcache, :restorecache)
    ff = string("$(f)_")
    @eval ($f)() = ccall(($ff, libooptools), Cvoid, ())
end

for f in (:getversionkey, :getcmpbits, :getdebugkey, :getwarndigits, :geterrdigits, 
    :getepsi)
    ff = string("$(f)_")
    @eval ($f)() = ccall(($ff, libooptools), Int64, ())
end

for f in (:setversionkey, :setcmpbits, :setdebugkey, :setwarndigits, :seterrdigits)
    ff = string("$(f)_")
    @eval ($f)(b::Int) = ccall(($ff, libooptools), Cvoid, (Ref{Int64},), b)
end

for f in (:getmaxdev, :getdelta, :getmudim, :getlambda, :getminmass, :getuvdiv, 
    :getzeroeps, :getdiffeps)
    ff = string("$(f)_")
    @eval ($f)() = ccall(($ff, libooptools), Float64, ())
end


for f in (:setmaxdev, :setdelta, :setmudim, :setlambda, :setminmass, :setuvdiv, 
    :setzeroeps, :setdiffeps)
    ff = string("$(f)_")
    @eval ($f)(b::Real) = ccall(($ff, libooptools), Cvoid, (Ref{Float64},), b)
end

"""
    setdebugrange(f::Int, t::Int)

The integrals are listed in the output with a unique serial number. If the list of integrals becomes too long, one can select only a range of serial numbers for viewing.
"""
setdebugrange(f::Int, t::Int) = ccall((:setdebugrange_, libooptools), Cvoid, 
        (Ref{Int64}, Ref{Int64}), 
        f,           t )

"""
    ltexi()

summary of errors.
""" ltexi

"""
    clearcache()

remove all integrals from the cache.
""" clearcache

"""
    markcache()

mark the current cache pointers.
""" markcache

"""
    restorecache()

restore cache pointers marked by `markcache()`.
""" restorecache

"""
    getcmpbits()

the number of bits for the cache-lookup precision. The default is 62 for double precision, 64 for quadruple precision.
""" getcmpbits

"""
    setcmpbits(b::Int)

set the number of bits for cache-lookup precision.
""" setcmpbits


"""
    getversionkey()

return the version key; the loop integrals are implemented using different versions (Denner, `FF`). For more information, see Section 1.3.10 of the `LoopTools` manual.
""" getversionkey

"""
    setversionkey(k::Int)

set the version key to choose the implementations of various functions and whether checking is performed.
""" setversionkey


"""
    getmaxdev()
    setmaxdev(b::Real)

set the tolerance of the deviation between different implementations of functions.  The default value is 1e-12 for issuing warnings.
""" getmaxdev, setmaxdev



"""
    getdebugkey()
    setdebugkey()

Debugging output can be turned on.
""" getdebugkey, setdebugkey


@doc raw"""
    getzeroeps()
    setzeroeps(b::Real)

A given quantity `x` is tested to be zero if `|x|` is smaller than `getzeroeps()`. Default value: ``10^{-22}``.
""" getzeroeps, setzeroeps

@doc raw"""
    getdiffeps()
    setdiffeps(b::Real)

Two quantities are tested for equality if the absolute value of their difference is smaller than `getdiffoeps()`. Default value: ``10^{-12}``.
""" getdiffeps, setdiffeps

@doc raw"""
    getdelta()
    setdelta(Δ::Real)

`getdelta()` returns the value of ``\Delta``, the finite piece of UV divergence, 
default to `0` (the ``\overline{MS}`` scheme); 
change by `setdelta(Δ)`.
""" getdelta, setdelta

@doc raw"""
    getlambda()
    setlambda(λ::Real)

`getdelta()` returns the value of ``\lambda^2`` for regularizing the IR divergence.
It is positive for photon-mass regularization; ``0``, ``-1`` and ``-2`` give the 
finite piece, coefficients of the ``ε^{-1}`` and ``ε^{-2}``, respectively.
Change by `setlambda(λ)`.
""" getlambda, setlambda

@doc raw"""
    getmudim()
    setmudim(μ::Real)

The dimensional regularization scale ``μ``; the default value is `1.0`.
""" getmudim, setmudim

@doc raw"""
    getminmass()
    setminmass(m::Real)

For regularizing collinear divergence.
""" getminmass, setminmass

@doc raw"""
    getuvdiv()
    setuvdiv(x::Real)

Switch on (`x=1`, default) or off (`x=0`) the UV divergence part of ``1/ε``.
""" getuvdiv, setuvdiv