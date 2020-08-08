using LoopTools
using Documenter

makedocs(;
    modules=[LoopTools],
    authors="Feng-Kun Guo",
    repo="https://github.com/fkguo/LoopTools.jl/blob/{commit}{path}#L{line}",
    sitename="LoopTools.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://fkguo.github.io/LoopTools.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fkguo/LoopTools.jl"
)
