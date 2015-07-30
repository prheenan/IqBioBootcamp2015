%Simple linear regression

%read in data points from a file
%split them into x and y coordinates
points = importdata('random_points.csv',',',1);
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
plot(X, Y, 'r.', linspace(-10,10,1000), m * linspace(-10,10,1000) + b, 'b-')
title('Linear Regression')
xlabel('X')
ylabel('Y')

