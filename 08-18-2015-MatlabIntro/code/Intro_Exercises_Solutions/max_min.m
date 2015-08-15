%return the maximum and minimum values in a list
function [a, b] = max_min(L)
a = L(1);
b = L(1);
for i = 2:length(L)
    if L(i) > a
        a = L(i);
    end
    if L(i) < b
        b = L(i);
    end
end