%compute the nth fibonacci number
%f_0 = 0, f_1 = 1
function f = nthFib(n)
if n < 2
    f = n;
else
    n = n - 1;
    a = 0;
    b = 1;
    while n > 0
        c = b;
        b = a + b;
        a = c;
        n = n -1;
    end
    f = b;
end