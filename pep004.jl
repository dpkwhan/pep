function palindromic_number_1()::Int
    max_palindrome = 0
    for i = 100:999, j = 100:999
        v = i*j
        s = string(v)
        if s == reverse(s) && v > max_palindrome
            max_palindrome = v
        end
    end
    return max_palindrome
end

function is_palindrome(n::Int)
    if n%10 == 0
        return false
    end
    original_n = n

    reversed = 0
    while n > 0
        reversed = 10*reversed + n % 10
        n = div(n, 10)
    end
    return reversed == original_n
end

function palindromic_number_2()::Int
    max_palindrome = 0
    for i = 100:999, j = 100:999
        v = i*j
        if is_palindrome(v) && v > max_palindrome
            max_palindrome = v
        end
    end
    return max_palindrome
end

function palindromic_number_3()::Int
    max_palindrome = 0
    for i = 100:999
        for j = i:999
            v = i*j
            if is_palindrome(v) && v > max_palindrome
                max_palindrome = v
            end
        end
    end
    return max_palindrome
end

function palindromic_number_4()::Int
    max_palindrome = 0
    for i = 999:-1:100
        for j = 999:-1:i
            v = i*j
            if v < max_palindrome
                continue
            end
            if is_palindrome(v)
                max_palindrome = v
            end
        end
    end
    return max_palindrome
end

function palindromic_number_5()::Int
    max_palindrome = 0
    a = 999
    while a >= 100
        if a % 11 == 0
            b = 999
            db = 1
        else
            b = 990
            db = 11
        end
        
        while b >= a
            if a*b <= max_palindrome
                break
            end

            if is_palindrome(a*b)
                max_palindrome = a*b
            end
                
            b -= db
        end
        a -= 1
    end
    return max_palindrome
end

println("Method 1:")
println(@time palindromic_number_1())

println("Method 2:")
println(@time palindromic_number_2())

println("Method 3:")
println(@time palindromic_number_3())

println("Method 4:")
println(@time palindromic_number_4())

println("Method 5:")
println(@time palindromic_number_5())
