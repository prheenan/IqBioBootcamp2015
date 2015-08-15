%find the sum of values in a list l
%only include values in the sum that are divisible by at least one element
%of d
function [s] = sumDivis(l, d)
if isempty(d)
    d = [1];
end
s = 0;
for i = l
    for j = d
        if mod(i,j) == 0
            s = s + i;
            break
        end
    end
end