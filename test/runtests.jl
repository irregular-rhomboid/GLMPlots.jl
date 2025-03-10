using GLMPlots
using Test
using StableRNGs
using GLM
using StatsPlots
using GLMPlots

@testset "GLMPlots.jl" begin
    @testset "Utility functions" begin
        using GLMPlots: leverage, standardized_residuals
        rng = StableRNG(2025)
        X = randn(rng,10,3)
        y = randn(rng,10)
        l = lm(X,y)
        h = leverage(l)
        r = standardized_residuals(l)
        @test all(!isnan, r)
        @test all(>=(0.0), h)
    end
    @testset "StatsPlots Recipes" begin
        # NB. These tests follow the tests of StatsPlots. They mostly check that the functions don't crash
        rng = StableRNG(2025)
        X = randn(rng,10,3)
        y = randn(rng,10)
        l = lm(X,y)
        @testset "residualplot" begin
            pl = GLMPlots.residualplot(l)
            @test show(devnull, pl) isa Nothing
            GLMPlots.residualplot!(pl, l)
            @test show(devnull, pl) isa Nothing
        end
        @testset "residualsleverageplot" begin
            pl = GLMPlots.residualsleverageplot(l)
            @test show(devnull, pl) isa Nothing
            GLMPlots.residualsleverageplot!(pl, l)
            @test show(devnull, pl) isa Nothing
        end
        @testset "scalelocationplot" begin
            pl = GLMPlots.scalelocationplot(l)
            @test show(devnull, pl) isa Nothing
            GLMPlots.scalelocationplot!(pl, l)
            @test show(devnull, pl) isa Nothing
        end
        @testset "qqplot" begin
            pl = StatsPlots.qqplot(l)
            @test show(devnull, pl) isa Nothing
            StatsPlots.qqplot!(pl, l)
            @test show(devnull, pl) isa Nothing
        end
        @testset "qqnorm" begin
            pl = StatsPlots.qqnorm(l)
            @test show(devnull, pl) isa Nothing
            StatsPlots.qqnorm!(pl, l)
            @test show(devnull, pl) isa Nothing
        end

        @testset "cooksleverageplot" begin
            pl = GLMPlots.cooksleverageplot(l)
            @test show(devnull, pl) isa Nothing
            GLMPlots.cooksleverageplot!(pl, l)
            @test show(devnull, pl) isa Nothing
        end
        @testset "lmplot" begin
            pl = GLMPlots.lmplot(l)
            @test show(devnull, pl) isa Nothing
        end
    end
end
