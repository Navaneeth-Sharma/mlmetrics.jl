using Test
include("../src/loss.jl")

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

    @testset "R2SCORE" begin
        @test r2score(1, 1) == 1
        @test r2score([1,1], [1,1]) == 1
        @test r2score([1,1], [3,4]) == -11.5
    end

    @testset "BINCROSSENTROPY" begin
        @test binarycrossentropy(1, 0.9) == 1
        @test binarycrossentropy([0,0,1], [0.2,0.3,0.8]) == 0.3861431206792365
    end

end
