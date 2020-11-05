close all

m = 11; % number of points
deg = 2;

x = linspace(0,1,m);
x = x(:)
X = fliplr(vander(x));

rng('default');
s = rng;
y = x.^2 + 0.1 * randn(length(x),1);

x1 = linspace(0,1);
y1 = x1.^2;

theta = polyfit(x,y,deg);
disp(theta)

figure 
plot(x,x.^2,'o')
hold on
x = linspace(0,1);
y1 = polyval(theta,x1);
plot(x1,y1)
hold off

(y - X(:,1:(deg+1)) * flip(theta).')' * (y - X(:,1:(deg+1)) * flip(theta).') / length(x)
