format long 
close all

m = 11
deg = 3

x = linspace(0,1,m);
x = x(:);

% non noisy data

y = x.^2;
p = polyfit(x,y,deg);
disp(p)
x1 = linspace(0,1);
y1 = polyval(p,x1);

figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

% noisy data

% Normal equations

X = fliplr(vander(x));

X = X(:,1:(deg+1));

theta = (X.' * X) \ (X.' * y) 

theta = inv(X.' * X) * (X.' * y) 

figure
scatter(0:deg,theta)
title('\theta : noisy data');

disp('mean square ')
(y - X * theta).' * (y - X*theta) / length(x)

s = svd(X)

return

% noisy data


y = x.^2 + 0.01 * randn(m,1);

theta = (X.' * X) \ (X.' * y) 

close all 
figure
plot(theta)
title('\theta : noisy data');

disp('mean square')
(y - X * theta).' * (y - X*theta) / length(x)

s = svd(X)

return

% MATLAB built-in routines

y = x.^2 + 0.01 * randn(1,m);

p = polyfit(x,y,deg);
disp(p)
x1 = linspace(0,1);
y1 = polyval(p,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off


