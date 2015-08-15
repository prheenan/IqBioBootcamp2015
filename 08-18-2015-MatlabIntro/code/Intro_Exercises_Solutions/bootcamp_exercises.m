%bootcamp 2015 introduction to matlab exercises

%hello iq bio!
display('Hello, IQ Biology!')


%%
%Variables

%define a variable pi to be 3.14159
pi = 3.14159;

%define a variable radius
radius = 5;

%compute the area of the circle
area = pi*radius^2


%%
%Iteration

%find the sum of values from 1 to 100
l = 1:100;
sum = 0;
for i = l
    sum = sum + i;
end
sum


%%
%Conditionals and loops

%get a list of numbers from 1 to 100 that are less than 10 or even
result = [];
l = 1:100;
for i = l
    if (i < 10) | (mod(i,2) == 0)
        result = [result i];
    end
end
result


%%
%functions

%make a function called sumList

%make a function called sumDivis that sums the elements of a list that are
%divisible by at least one element from another list:
%sumDivis([1 2 3 4], [1]) = 10
%sumDivis([1 2 3 4], [2]) = 6
%sumDivis([1 2 3 4], [1 2]) = 10

%write a function to find the average of the values in a list

%write a function to find the maximum and minimum values of a list

%make a function called nthFib to compute the nth fibonacci number
%iteratively where nthFib(0) = 0, nthFib(1) = 1, nthFib(n) = nthFib(n-1) + 
%nthFib(n-2)

%make a function to determine whether or not a number is prime

%find the sum of the first 100 fibonacci numbers
fibSum = 0;
for i = 1:100
    fibSum = fibSum + nthFib(i);
end
fibSum

%find the sum of primes less than 100
primeSum = 0;
i = 0;
while i < 100
    if isPrime(i)
        primeSum = primeSum + i;
    end
    i = i + 1;
end
primeSum



%%
%simple 2d plotting

%plot the set of points defined in X and Y with and without connecting
%lines on the same set of axes. label the graph appropriately, include a legend
X = 1:10;
Y = (1:10).^3;

figure(1)
plot(X, Y, 'b-', X, Y, 'r.') 
title('Plotting in Matlab')
xlabel('X')
ylabel('Y')
legend('curve', 'points')

figure(2)
hold all
plot(X, Y)
plot(X, Y, 'r.')
xlabel('X')
ylabel('Y')
legend('curve', 'points')

