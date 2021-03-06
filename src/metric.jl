module mlmetrics
using  Statistics

"""
    struct mse{T<:AbstractFloat}
        y::Vector
        ŷ::Vector
    end
    The mean squared error is the sum of the squared differences between the
    predicted and observed values.


    struct mae{T<:AbstractFloat}
        y::Vector
        ŷ::Vector
    end
    The mean absolute error is the sum of the absolute differences between the
    predicted and observed values.


    struct rmse{T<:AbstractFloat}
        y::Vector
        ŷ::Vector
    end
    The root mean squared error is the square root of the mean squared error.


    struct rmae{T<:AbstractFloat}
        y::Vector
        ŷ::Vector
    end
    The root mean absolute error is the square root of the mean absolute error.


    struct rmsle{T<:AbstractFloat}
        y::Vector
        ŷ::Vector
    end
    The root mean squared log error is the square root of the mean squared log error.


    struct r2score{T<:AbstractFloat}
        y::Vector
        ŷ::Vector
    end
    The R2 is a statistic that will give some information about the goodness of fit of a model.
"""



struct mse{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function mse(y, ŷ)
        return mean((y - ŷ).^2)
    end
end

struct mae{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function mae(y, ŷ)
        return mean(abs.(y - ŷ))
    end
end

struct rmse{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function rmse(y, ŷ)
        return sqrt(mse(y, ŷ))
    end
end

struct rmae{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function rmae(y, ŷ)
        return sqrt(mae(y, ŷ))
    end
end

struct rmsle{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function rmsle(y, ŷ)
        return sqrt(mean((log.(y .+ 1) - log.(ŷ .+ 1)).^2))
    end
end

struct r2score{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function r2score(y, ŷ)
        squares = sum(y.^2)
        residuals = sum(y - ŷ).^2
        return 1 - residuals/squares
    end
end

struct binarycrossentropy{T<:AbstractFloat}
    y::Vector
    ŷ::Vector

    function binarycrossentropy(y::Vector, ŷ::Vector)
        ε = 1e-10
        return -mean(y.*log2.(ŷ .+ ε) + (1 .- y).*log2.(1 .- ŷ .+ ε))
    end
end

struct accuracy{T<:AbstractFloat}
    y_true::AbstractArray
    y_predict::AbstractArray

    function accuracy(y_true::AbstractArray, y_predict::AbstractArray)
        return sum(y_true.==y_predict)/length(y_true)
    end

end

struct precision{T<:AbstractFloat}
    y_true::AbstractArray
    y_predict::AbstractArray

    function precision(y_true::AbstractArray, y_predict::AbstractArray)
        true_positives = sum(y_true.== 1 .== y_predict)
        true_negatives = sum(y_true.== 0 .== y_predict)
        false_positives = sum(y_true.!= 1 .== y_predict)
        false_negatives = sum(y_true.!= 0 .== y_predict)

        return true_positives/(true_positives + false_positives)
    end

end


struct recall{T<:AbstractFloat}
    y_true::AbstractArray
    y_predict::AbstractArray

    function recall(y_true::AbstractArray, y_predict::AbstractArray)
        true_positives = sum(y_true.== 1 .== y_predict)
        true_negatives = sum(y_true.== 0 .== y_predict)
        false_positives = sum(y_true.!= 1 .== y_predict)
        false_negatives = sum(y_true.!= 0 .== y_predict)

        return true_positives/(true_positives + false_negatives)
    end
    
end

struct f1_score{T<:AbstractFloat}
    y_true::AbstractArray
    y_predict::AbstractArray

    function f1_score(y_true::AbstractArray, y_predict::AbstractArray)
        num =  2 * precision(y_true, y_predict) * recall(y_true, y_predict) 
        den = precision(y_true, y_predict) + recall(y_true, y_predict)
        return num/den
    end

end

end

