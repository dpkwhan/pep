# Problem 1: https://projecteuler.net/problem=1
# See the overview: https://projecteuler.net/overview=002

function sum_even_fibonacci_number(maxvalue::Int)::Int
    maxvalue <= 1 && return 0
    
    s = 0
    v1 = v2 = 1
    while true
        v = v1 + v2
        v > maxvalue && break
        mod(v, 2) == 0 && (s += v)
        (v1, v2) = (v2, v)
    end
    return s
end

function sum_every_third_fibonacci_number(maxvalue::Int)::Int
    maxvalue <= 1 && return 0
    
    s = 0
    v1 = v2 = 1
    v3 = v1 + v2
    while v3 <= maxvalue
        s += v3
        v1 = v3 + v2
        v2 = v3 + v1
        v3 = v1 + v2
    end
    return s
end

function sum_fibonacci_number_recursive(maxvalue::Int)::Int
    if maxvalue < 2
        return 0
    elseif maxvalue < 8
        return 2
    elseif maxvalue < 34
        return 10
    end
    
    s = 10
    (v1, v2, v3) = (2, 8, 34)
    while v3 <= maxvalue
        s += v3
        v1 = v2
        v2 = v3
        v3 = 4*v2 + v1
    end
    return s
end

limit = 4_000_000
println("Sum even numbers: ", sum_even_fibonacci_number(limit))
println("Sum every third number: ", sum_every_third_fibonacci_number(limit))
println("Sum recursively: ", sum_fibonacci_number_recursive(limit))
