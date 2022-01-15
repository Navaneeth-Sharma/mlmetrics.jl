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
"""

using  Statistics


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
