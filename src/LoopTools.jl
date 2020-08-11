module LoopTools

export A0, A0i, A00, Aget,
       B0, B0i, B1, B00, B11, B001, B111, Bget,
       C0, C0i, Cget, D0, D0i, Dget, E0, E0i, Eget
export aa0, bb0, bb1, bb00, bb11, bb001, bb111
export dbb0, dbb1, dbb00, dbb11, dbb001
export cc0, cc1, cc2, cc00, cc11, cc12, cc22, cc001, cc002, cc111, cc112, cc122
export cc222, cc0000, cc0011, cc0012, cc0022, cc1111, cc1112, cc1122, cc1222, cc2222
export dd0, dd1, dd2, dd3, dd00, dd11, dd12, dd13, dd22, dd23, dd33, dd001, dd002, dd003
export dd111, dd112, dd113, dd122, dd123, dd133, dd222, dd223, dd233, dd333
export dd0000, dd0011, dd0012, dd0013, dd0022, dd0023, dd0033, dd1111, dd1112, dd1113,
dd1122, dd1123, dd1133, dd1222, dd1223, dd1233, dd1333, dd2222, dd2223, dd2233, dd2333,
dd3333, dd00001, dd00002, dd00003, dd00111, dd00112, dd00113, dd00122, dd00123, dd00133,
dd00222, dd00223, dd00233, dd00333, dd11111, dd11112, dd11113, dd11122, dd11123, dd11133,
dd11222, dd11223, dd11233, dd11333, dd12222, dd12223, dd12233, dd12333, dd13333, dd22222,
dd22223, dd22233, dd22333, dd23333, dd33333
export ee0, ee1, ee2, ee3, ee4, ee00, ee11, ee12, ee13, ee14, ee22, ee23, ee24, ee33, ee34, ee44,
ee001, ee002, ee003, ee004, ee111, ee112, ee113, ee114, ee122, ee123, ee124, ee133, ee134, ee144,
ee222, ee223, ee224, ee233, ee234, ee244, ee333, ee334, ee344, ee444, ee0000, ee0011, ee0012, ee0013,
ee0014, ee0022, ee0023, ee0024, ee0033, ee0034, ee0044, ee1111, ee1112, ee1113, ee1114, ee1122,
ee1123, ee1124, ee1133, ee1134, ee1144, ee1222, ee1223, ee1224, ee1233, ee1234, ee1244, ee1333,
ee1334, ee1344, ee1444, ee2222, ee2223, ee2224, ee2233, ee2234, ee2244, ee2333, ee2334, ee2344,
ee2444, ee3333, ee3334, ee3344, ee3444, ee4444

export libooptools

export ltexi, clearcache, markcache, restorecache, getcmpbits, setcmpbits,
       getversionkey, setversionkey, getdebugkey, setdebugkey, getmaxdev, setmaxdev, 
       setdebugrange, getwarndigits, setwarndigits, geterrdigits, seterrdigits, getdelta, 
       setdelta, getmudim, setmudim, getlambda, setlambda, getminmass, setminmass, setuvdiv,
       getzeroeps, setzeroeps, setdiffeps, getepsi

export I, IC0

using LoopTools_jll

include("init.jl")


include("A.jl")
include("B.jl")
include("C.jl")
include("D.jl")
include("E.jl")

include("utils.jl")

end # module
