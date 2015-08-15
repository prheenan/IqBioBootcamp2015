
%Plotting Demo
X = 1:5;
Y = 1:5;

%start a new figure for each plot
figure(1)
plot(X, Y)

%use red dots for the points
figure(2)
plot(X, Y, 'r.')

%connecting line is sequential
X = [1 5 2 4 3];
Y = 1:5;

figure(3)
plot(X, Y)

%multiple sets of points can be plotted
X1 = 1:5;
Y1 = 1:5;
Y2 = 5:-1:1;

figure(4)
plot(X1, Y1, 'r.', X1, Y2, 'g*')

%you can also use hold all
figure(5)
hold all
plot(X1, Y2, 'g*')
plot(X1, Y1, 'r.')

%in general you will want to label your
%graphs and include legends
figure(6)
plot(X1, Y1, 'r.', X1, Y2, 'g*')
title('Two Line Plot Example')
xlabel('X values')
ylabel('Y values')
legend('line 1', 'line 2')

%plotting a function
%the function must accept a list as input
%here we're plotting y = x^2
%linspace(a, b) returns a list of evenly spaced values between a and b
%if a and b are far apart you can supply a third argument specifying the
%number of points to include
X = linspace(1, 10);

figure(7)
plot(X, square(linspace(1, 10)), 'r.')
title('Plotting a Function using linspace')
xlabel('X values')
ylabel('Y values')

%use 1000 points
X = linspace(1, 10, 1000);

figure(8)
plot(X, square(linspace(1, 10, 1000)), 'r.')
title('Plotting a Function using linspace with 1000 points')
xlabel('X values')
ylabel('Y values')
