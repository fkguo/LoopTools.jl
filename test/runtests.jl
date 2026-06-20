using LoopTools
using Test

@testset "LoopTools.jl" begin

    # ---------------------------------------------------------------------
    # DRResult: the ε-Laurent simplifier in src/sym.jl. It builds the
    # symbolic combination  c0 + c1/ε + c2/ε²  and applies the SymbolicUtils
    # rewrite rules (drop any term whose coefficient is zero). This testset
    # pins that drop behaviour so the SymbolicUtils compat range (1–4) stays
    # honest: it exercises @rule/@acrule/_iszero/Chain/Postwalk on whatever
    # SymbolicUtils major the environment resolves.
    # ---------------------------------------------------------------------
    @testset "DRResult ε-Laurent coefficient simplifier" begin
        # all three coefficients nonzero → all three terms kept
        @test isequal(DRResult(1.0, 2.0, 3.0), 1.0 + 2.0/ε + 3.0/ε^2)

        # zero 1/ε coefficient → that term is dropped
        @test isequal(DRResult(1.5, 0.0, 2.0), 1.5 + 2.0/ε^2)

        # only the 1/ε term survives
        @test isequal(DRResult(0.0, 3.0, 0.0), 3.0/ε)

        # only the 1/ε² term survives
        @test isequal(DRResult(0.0, 0.0, 4.0), 4.0/ε^2)

        # Fully-collapsed cases (no surviving ε term). NOTE: across SymbolicUtils
        # majors the wrapper type of a fully-cancelled result differs — ≤3.x
        # unwraps to a plain `Float64`, 4.x keeps a `BasicSymbolic` constant — so
        # `== 2.5` would be a symbolic equation on 4.x. We assert the *value*
        # (the simplifier's contract) representation-robustly via the printed form.
        @test string(DRResult(2.5, 0.0, 0.0)) == "2.5"   # bare finite part
        @test string(DRResult(0.0, 0.0, 0.0)) == "0.0"   # everything dropped
    end

end
