# Problem 1: https://projecteuler.net/problem=3
# See the overview: https://projecteuler.net/overview=003

function largest_prime_factor_1(n::Int)::Int
    i = 2
    while i * i <= n
        if n % i > 0
            i += 1
        else
            n ÷= i
        end
    end
    return n
end

function largest_prime_factor_2(n::Int)::Int
    if n % 2 == 0
        n = div(n, 2)
        last_factor = 2
        while n % 2 == 0
            n = div(n, 2)
        end
    else
        last_factor = 1
    end

    factor = 3
    while n > 1
        if n % factor == 0
            n = div(n, factor)
            last_factor = factor
            while n % factor == 0
                n = div(n, factor)
            end
        end
        factor += 2
    end
    return last_factor
end

function largest_prime_factor_3(n::Int)::Int
    if n % 2 == 0
        n = div(n, 2)
        last_factor = 2
        while n % 2 == 0
            n = div(n, 2)
        end
    else
        last_factor = 1
    end

    factor = 3
    max_factor = sqrt(n)
    while n > 1 && factor <= max_factor
        if n % factor == 0
            n = div(n, factor)
            last_factor = factor
            while n % factor == 0
                n = div(n, factor)
            end
        end
        factor += 2
    end

    if n == 1
        return last_factor
    else
        return n
    end
end


n = 600_851_475_143
println("Method 1: ",  largest_prime_factor_1(n))
println("Method 2: ",  largest_prime_factor_2(n))
println("Method 3: ",  largest_prime_factor_3(n))
