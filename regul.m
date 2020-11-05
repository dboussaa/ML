clear all
close all
clc

format SHORTE

m = 11;
x = linspace(0,1,m);
x = x(:);

data = fliplr(vander(x));

% noisy data

thetas = zeros(m,m);
c = zeros(m,1);
mmse = zeros(m,1);

y = x.^2 + .01 * randn(length(x),1);

x1 = linspace(0,1);
y1 = x1.^2;

figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

for i = 1:m
    X = data(:,1:i);
    A = X.' * X;
    theta = A \ (X.' * y);
    thetas(i,1:i) = theta;
    s = svd(A);
    cs(i) = max(s)/min(s);
    mmses(i) = (y - X * theta).' * (y - X*theta) / length(x);
end

disp('Polynomial Coefficients')
disp(thetas)
disp('Minimum mean square error')
disp(mmses)
disp('Condition numbers')
disp(cs)

y1 = polyval(flip(thetas(m,:)),x1);

figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

lambda = .001;

for i = 1:m
    X = data(:,1:i);
    A = X.' * X;
    theta = (A + lambda * eye(i,i)) \ (X.' * y);
    thetas(i,1:i) = theta;
    s = svd(A);
    cs(i) = max(s)/min(s);
    mmses(i) = (y - X * theta).' * (y - X*theta) / length(x);
end


disp('Polynomial Coefficients')
disp(thetas)
disp('Minimum mean square error')
disp(mmses)
disp('Condition numbers')
disp(cs)


p = polyfit(x, y, m-1);

disp(p)

y1 = polyval(flip(thetas(m,:)),x1);

figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off
