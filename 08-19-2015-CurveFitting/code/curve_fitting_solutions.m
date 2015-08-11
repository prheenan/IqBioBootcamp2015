%simple linear regression

%read in data points from a file
%split them into x and y coordinates
points = importdata('random_points_1.csv',',',1);
points.colheaders
X = points.data(:,1);
Y = points.data(:,2);

%trying to find m and b so that the sum of the squared residuals is
%minimized in y = mx + b

%first lets find the sample averages for the x and y values
%try this without using Matlab sum or mean functions
%in general a bar = 1/n * sum ai for 1 <= i <= n
%writing a general function might make sense then
xb = 1/length(X);
xSum = 0;
for i = 1:length(X);
  xSum = xSum + X(i);
end
xb = xb * xSum;

yb = 1/length(Y);
ySum = 0;
for i = 1:length(Y);
  ySum = ySum + Y(i);
end
yb = yb * ySum;

%but Matlab has both a sum and a mean function!
xb = mean(X);
yb = mean(Y);

%now let's find m
%m = (sum of (xi - xb)(yi - yb) for 1 <= i <= n) / (sum of (xi - xb)^2 for 1 <= i <= n)
nume = 0;
denom = 0;
for i = 1:length(X);
  nume = nume + (X(i) - xb)*(Y(i) - yb);
  denom = denom + (X(i) - xb)^2;
end
m = nume/denom

%b = yb - m(xb)
b = yb - m*xb

%plot the data and the line we found
figure(1)
%plot in the range -10 to 10
plot(X, Y, 'r.', linspace(-10,10,1000), m * linspace(-10,10,1000) + b, 'b-')
title('Linear Regression')
xlabel('X')
ylabel('Y')

%we can also calculate r^2
xyb = mean(X.*Y);
xb2 = mean(X.^2);
yb2 = mean(Y.^2);
r = (xyb - xb*yb)/(sqrt((xb2 - xb^2)*(yb2 - yb^2)));
r^2

%%

%But wait! Matlab has a number of built in curve fitting functions
%We'll take a look at polyfit and fit

%polyfit
%http://www.mathworks.com/help/matlab/ref/polyfit.html?refresh=true
%takes a list of the x coordinates, a list of corresponding y coordinates, 
%and the degree of the polynomial
%returns [p,S,mu] where p is a list of coefficients for the fit in
%descending order of power, S can be given to polyval to get error 
%estimates, and mu is [mean(x), std(x)]

%let's compare this to your implementation
p = polyfit(X, Y, 1)

figure(2)
%polyval can be used to evaluate the fit
%plot in the range -10 to 10
plot(X, Y, 'r.', linspace(-10,10,1000), polyval(p, linspace(-10,10,1000)), 'b-')
title('Linear Regression (polyfit)')
xlabel('X')
ylabel('Y')

%%

%Of course this can be used on more complicated functions
%lets read in points from another file
%these are from a third degree polynomial
points3 = importdata('random_points_3.csv',',',1);
points3.textdata
X3 = points3.data(:,1);
Y3 = points3.data(:,2);

p3 = polyfit(X3, Y3, 3)

figure(3)
%plot in the range -50 to 50
plot(X3, Y3, 'r.', linspace(-50,50,1000), polyval(p3, linspace(-50,50,1000)), 'b-')
title('Third Degree Polynomial (polyfit)')
xlabel('X')
ylabel('Y')

%%

%The last curve fitting function we'll look at is fit
%http://www.mathworks.com/help/curvefit/fit.html
%fit has a number of different argument and output combinations
%here we will use the most basic

%first look at the original data set

%gof contains goodness of fit statistics
[theFit, gof] = fit(X, Y, 'poly1')

figure(4)
plot(theFit, 'b-', X, Y, 'r.')
title('Linear Fit (fit)')
xlabel('X')
ylabel('Y')

%%

%now use fit on the third degree polynomial
%first we need to define a fittype object with the function we want to use
%to do this we can use an 'expression'
func = fittype('a*x.^3+b*x.^2+c*x+d', 'independent', {'x'});

%or an anonymous function (there are several other ways)
%func = ( @(a,b,c,d,x) a*x.^3+b*x.^2+c*x+d, 'independent', {'x'} )

[theFit3, gof3] = fit(X3, Y3, func)

figure(5)
plot(theFit3, 'b-', X3, Y3, 'r.')
title('Third Degree Polynomail (fit)')
xlabel('X')
ylabel('Y')

%%

%one last simple example
%use fit on points from the equation y = a*e^(-ax)
expPoints = importdata('random_points_exp.csv',',',1);
expPoints.textdata
expX = expPoints.data(:,1);
expY = expPoints.data(:,2);

expFunc = fittype('a*exp(-a*x)', 'independent', {'x'})
[expFit, expGof] = fit(expX, expY, expFunc)

figure(6)
plot(expFit, 'b-', expX, expY, 'r.')
title('Exponential (fit)')
xlabel('X')
ylabel('Y')

%%

%now read in points from 'random_points_sin.csv' and plot them
%remember, every line of this file contains a point (no header)
sinePoints = importdata('random_points_sin.csv',',',0);
sineX = sinePoints(:,1);
sineY = sinePoints(:,2);

figure(7)
plot(sineX, sineY, 'r.')

%based on what you see, fit a polynomial to the data

%now try several fits, some with very low degree and some with very high
%degree

p2 = polyfit(sineX, sineY, 2);
p6 = polyfit(sineX, sineY, 6);
p10 = polyfit(sineX, sineY, 10);
p12 = polyfit(sineX, sineY, 12);
p16 = polyfit(sineX, sineY, 16);

figure(8)
%plot in the range -10 to 10
plot(sineX, sineY, 'r.', linspace(-10,10,1000), polyval(p2, linspace(-10,10,1000)),...
    linspace(-10,10,1000), polyval(p6, linspace(-10,10,1000)), ...
    linspace(-10,10,1000), polyval(p10, linspace(-10,10,1000)), ...
    linspace(-10,10,1000), polyval(p12, linspace(-10,10,1000)), ...
    linspace(-10,10,1000), polyval(p16, linspace(-10,10,1000)))
legend('data','2','6','10','12','16')
title('Sine curve fit with different polynomials')
xlabel('X')
ylabel('Y')

%what differences between the fits do you see if you expand the range to be
%-15 to 15?

%%

%Now plot and fit the means of the image data collected yesterday
%include error bars using the function errorbar
%http://www.mathworks.com/help/matlab/ref/errorbar.html


%%

%generate a list of random x coordinates from Uniform(-5,5)
%these must be column vectors for polyfit
randX = unifrnd(-5,5,100,1);
randY = zeros(100,1);
for i=1:100
    randY(i) = randX(i)^2 + randX(i) + 1 + normrnd(0, 1);
end

%now fit a second order polynomial to the points using polyfit and fit
p2 = polyfit(randX, randY, 2);
[theFit, gof] = fit(randX, randY, 'poly2')

figure(9)
%plot in the range -5 to 5
plot(randX, randY, 'r.', linspace(-5,5,1000), polyval(p2, linspace(-5,5,1000)))
title('Fit to randomly generated points (polyfit)')
xlabel('X')
ylabel('Y')

figure(10)
plot(theFit, 'b-', randX, randY, 'r.')
title('Fit to randomly generated points (fit)')
xlabel('X')
ylabel('Y')

