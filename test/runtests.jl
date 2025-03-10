using GLMPlots
using Test
using Aqua
using JET

@testset "GLMPlots.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(GLMPlots; ambiguities = false,)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(GLMPlots; target_defined_modules = true)
    end
    # Write your tests here.
end
