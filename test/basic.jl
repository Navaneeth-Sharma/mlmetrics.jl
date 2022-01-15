using Test
include("../src/basic.jl")

@testset "Basic Loss Functions" begin

    @testset "MSE" begin
        @test mse(1, 1) == 0
        @test mse([1,1], [1,1]) == 0
        @test mse([1,1], [3,4]) == 6.5
    end

    @testset "MAE" begin
        @test mae(1, 1) == 0
        @test mae([1,1], [1,1]) == 0
        @test mae([1,1], [3,4]) == 2.5
    end

    @testset "RMSE" begin
        @test rmse(1, 1) == 0
        @test rmse([1,1], [1,1]) == 0
        @test rmse([1,1], [3,4]) == 2.5495097567963922
    end

    @testset "RMAE" begin
        @test rmae(1, 1) == 0
        @test rmae([1,1], [1,1]) == 0
        @test rmae([1,1], [3,4]) == 1.5811388300841898
    end

    @testset "RMSLE" begin
        @test rmsle(1, 1) == 0
        @test rmsle([1,1], [1,1]) == 0
        @test rmsle([100,101], [30,400]) == 1.2785158831395131
    end
end
