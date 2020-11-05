clear all
close all
clc

format SHORTE

m = 101;
a = -1;
b = 1;
sig = 0.1;
maxDeg = 20;


x = linspace(a,b,m);
x = x(:);
X = fliplr(vander(x));

thetas = zeros(m,m);
c = zeros(m,1);
mmse = zeros(m,1);

y = x.^2 + sig * randn(length(x),1);

nTrain = round(0.8*length(x));
iTrain = randperm(length(x),nTrain);
iValid = setdiff(1:m,iTrain);

yTrain = y(iTrain);
yValid = y(iValid);

x1 = linspace(a,b);
y1 = x1.^2;

figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

for i = 1:(maxDeg+1)
    XTrain = X(iTrain,1:i);
    XValid = X(iValid,1:i);
    s = svd(X);
    theta = (XTrain.' * XTrain) \ (XTrain.' * yTrain);
    thetas(i,1:i) = (XTrain.' * XTrain) \ (XTrain.' * yTrain);
    cs(i) = max(s)/min(s);
    mmseTrain(i) = (yTrain - XTrain * theta).' * (yTrain - XTrain*theta) / length(yTrain);
    mmseValid(i) = (yValid - XValid * theta).' * (yValid - XValid*theta) / length(yValid);
end


disp('Polynomial Coefficients')
%disp(thetas);

disp('Minimum mean square error --- Train')
%disp(mmseTrain);

disp('Minimum mean square error --- Valid')
%disp(mmseValid)

disp([mmseTrain, mmseValid]);

disp('Condition numbers')
%disp(cs);


[mmseTrain', mmseValid']


y1 = polyval(flip(thetas(maxDeg,:)),x1);

figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

