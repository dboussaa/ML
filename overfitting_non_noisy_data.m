format SHORTE

m = 7;
x = linspace(0,1,m);
x = x(:);

data = fliplr(vander(x));

% non noisy data


thetas = zeros(m,m);
c = zeros(m,1);
mmse = zeros(m,1);

y = x.^2;

for i = 1:m
    X = data(:,1:i);
    s = svd(X);
    theta = (X.' * X) \ (X.' * y);
    thetas(i,1:i) = (X.' * X) \ (X.' * y);
    cs(i) = max(s)/min(s);
    mmses(i) = (y - X * theta).' * (y - X*theta) / length(x);
end

disp(thetas)
disp(cs)
disp(mmses)