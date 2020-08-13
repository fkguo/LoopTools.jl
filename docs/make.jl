using Documenter, LoopTools

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
        "Definitions" => "definitions.md",
        "Example" => "example.md"
    ],
)

deploydocs(;
    repo="github.com/fkguo/LoopTools.jl.git",
    target = "build",
    deps = nothing,
    make = nothing,
    branch = "gh-pages"
    # push_preview=true,
)
