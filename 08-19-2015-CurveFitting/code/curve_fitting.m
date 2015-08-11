%simple linear regression

%read in data points from a file
%split them into x and y coordinates
points = 

X = 
Y = 

%trying to find m and b so that the sum of the squared residuals is
%minimized in y = mx + b

%first lets find the sample averages for the x and y values
%try this without using Matlab sum or mean functions
%in general a bar = 1/n * sum ai for 1 <= i <= n
%writing a general function might make sense then
xb = 

yb = 

%but Matlab has both a sum and a mean function!
xb = 
yb = 

%now let's find m
%m = (sum of (xi - xb)(yi - yb) for 1 <= i <= n) / (sum of (xi - xb)^2 for 1 <= i <= n)
m = 

%b = yb - m(xb)
b = 

%plot the data and the line we found
figure(1)
%plot in the range -10 to 10


%we can also calculate r^2
r = 
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
p = 

figure(2)
%polyval can be used to evaluate the fit
%plot in the range -10 to 10


%%

%Of course this can be used on more complicated functions
%lets read in points from another file
%these are from a third degree polynomial
points3 = 
X3 = 
Y3 = 

p3 = 

figure(3)
%plot in the range -50 to 50


%%

%The last curve fitting function we'll look at is fit
%http://www.mathworks.com/help/curvefit/fit.html
%fit has a number of different argument and output combinations
%here we will use the most basic

%first look at the original data set

%gof contains goodness of fit statistics
[theFit, gof] = 

figure(4)


%%

%now use fit on the third degree polynomial
%first we need to define a fittype object with the function we want to use
%to do this we can use an 'expression'
func = 

%or an anonymous function (there are several other ways)
%func = 

[theFit3, gof3] = 

figure(5)

%%

%one last simple example
%use fit on points from the equation y = a*e^(-ax)
expPoints = 

expX = 
expY = 

expFunc = 
[expFit, expGof] = 

figure(6)

%%

%now read in points from 'random_points_sin.csv' and plot them
%remember, every line of this file contains a point (no header)
sinePoints = 
sineX = 
sineY = 

figure(7)

%based on what you see, fit a polynomial to the data

%now try several fits, some with very low degree and some with very high
%degree

p2 = 
p6 = 
p10 = 
p12 = 
p16 = 

figure(8)
%plot in the range -10 to 10


%what differences between the fits do you see if you expand the range to be
%-15 to 15?

%%

%Now plot and fit the means of the image data collected yesterday
%include error bars using the function errorbar
%http://www.mathworks.com/help/matlab/ref/errorbar.html


%%

%generate a list of random x coordinates from Uniform(-5,5)
%these must be column vectors for fit
randX = 
randY = 


%now fit a second order polynomial to the points using polyfit and fit
p2 = 
[theFit, gof] = 

figure(9)
%plot in the range -5 to 5


figure(10)


