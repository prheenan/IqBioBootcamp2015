%Simple linear regression

%read in data points from a file
%split them into x and y coordinates
points = importdata('random_points_1.csv',',',1);
points.colheaders
X = points.data(:,1);
Y = points.data(:,2);

%trying to find m and b so that the sum of the squared residuals is
%minimized in y = mx + b

%first lets find the sample averages for the x and y values
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
%figure(1)
%plot(X, Y, 'r.', linspace(-10,10,1000), m * linspace(-10,10,1000) + b, 'b-')
%title('Linear Regression')
%xlabel('X')
%ylabel('Y')

%we can also calculate r^2
xyb = mean(X.*Y);
xb2 = mean(X.^2);
yb2 = mean(Y.^2);
r = (xyb - xb*yb)/(sqrt((xb2 - xb^2)*(yb2 - yb^2)));
r^2


%But wait! Matlab has a number of built in curve fitting functions
%We'll take a look at polyfit and fit

%polyfit
%http://www.mathworks.com/help/matlab/ref/polyfit.html?refresh=true
%takes a list of the x coordinates, a list of corresponding y coordinates, and the degree of the polynomial
%returns [p,S,mu] where p is a list of coefficients for the fit in descending order of power, S can be given to polyval to get error estimates, and mu is [mean(x), std(x)]

%let's compare to your implementation
p = polyfit(X, Y, 1)

%figure(2)
%polyval can be used to evaluate the fit
%plot(X, Y, 'r.', linspace(-10,10,1000), polyval(p, linspace(-10,10,1000)), 'b-')
%title('Linear Regression (polyfit)')
%xlabel('X')
%ylabel('Y')

%Of course this can be used on more complicated functions
%lets read in points from another file
%these are from a third degree polynomial
points = importdata('random_points_3.csv',',',1);
points.textdata
X3 = points.data(:,1);
Y3 = points.data(:,2);

p = polyfit(X3, Y3, 3)

figure(3)
plot(X3, Y3, 'r.', linspace(-50,50,1000), polyval(p, linspace(-50,50,1000)), 'b-')
title('Third Degree Polynomial (polyfit)')
xlabel('X')
ylabel('Y')


%The last curve fitting function we'll look at is fit
%http://www.mathworks.com/help/curvefit/fit.html
%fit has a number of different argument and output combinations
%here we will use the most basic

%gof contains goodness of fit statistics
[theFit, gof] = fit(X, Y, 'poly1');
theFit
gof

figure(4)
plot(theFit, 'b-', X, Y, 'r.')
title('Linear Fit (fit)')
xlabel('X')
ylabel('Y')

%now use fit on the third degree polynomial
func = fittype( @(a,b,c,d,x) a*x.^3+b*x.^2+c*x+d, 'independent', {'x'} )
options = fitoptions('Method', 'NonlinearLeastSquares', 'StartPoint', [0 0 0 0], 'Lower', [-10 -10 -10 -10], 'Upper', [10 10 10 10])
[theFit3, gof3] = fit(X, Y, func, options);
theFit3
gof3

figure(5)
plot(theFit3, 'b-', X3, Y3, 'r.')
title('Third Degree Polynomail (fit)')
xlabel('X')
ylabel('Y')


%ok, now lets try to use fit to get a curve for the image data you produced
%
