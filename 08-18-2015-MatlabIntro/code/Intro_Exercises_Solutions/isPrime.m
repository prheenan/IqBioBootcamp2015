%return true if n is prime and false otherwise
function b = isPrime(n)
b = true;
if n == 2 | n == 3
    b = true;
elseif mod(n,2) == 0 | n <= 1
    b = false;
else
    for i = 3:2:floor(sqrt(n))
        if mod(n,i) == 0
            b = false;
            break
        end
    end
end