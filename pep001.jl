# Problem 1: https://projecteuler.net/problem=1
# See the overview: https://projecteuler.net/overview=001

"""
    sum_multiples_1(n::Int, d1::Int, d2::Int)::Int

Calculate the sum of all multiples of two given integers using loops.
"""
function sum_multiples_1(n::Int, d1::Int, d2::Int)::Int
    sv = min(d1, d2)
    ev = n - 1
    s = 0
    for i in sv:ev
        if mod(i, d1) == 0 || mod(i, d2) == 0
            s += i
        end
    end
    return s
end

"""
    sum_multiples_of(n::Int, d::Int)::Int

Calculate the sum of all multiples of ``d`` less than ``n``.

Return zero if ``n`` is non-positive. 

An ``ArgumentError`` will be thrown if the divisor ``d`` is non-positive.
"""
function sum_multiples_of(n::Int, d::Int)::Int
    n <= 0 && return 0
    d <= 0 && ArgumentError("d must be a positive integer")
    q = div(n-1, d)
    return d*0.5q*(q+1)
end

"""
    sum_multiples_2(n::Int, d1::Int, d2::Int)::Int

Calculate the sum of all multiples of two given integers using closed form formula.
"""
function sum_multiples_2(n::Int, d1::Int, d2::Int)::Int
    s1 = sum_multiples_of(n, d1)
    s2 = sum_multiples_of(n, d2)
    s3 = sum_multiples_of(n, d1*d2)
    return s1+s2-s3
end

println("Method 1:")
println(@time sum_multiples_1(1000, 3, 5))

println("Method 2:")
println(@time sum_multiples_2(1000, 3, 5))
