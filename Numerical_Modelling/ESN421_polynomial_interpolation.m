N = 5;
x = linspace(1,10,N); % check the dimension
y = randi(10,[1,N]);

% take the transpose of y

% prepare G matrix  - Dimension (N+1) x (N+1)
%    [x0^0  x0^1  x0^2 ..... x0^N]
%    |x1^0  x1^1  x1^2 ..... x1^N|
%    |x2^0  x2^1  x2^2 ..... x2^N|
%G = |x3^0  x3^1  x3^2 ..... x3^N|
%    |:  :   :     :     :    :  |
%    [xN^0  xN^1  xN^2 ..... xN^N]

G = [];
for i=1:N
    G = [G x'.^(i - 1)];
end

data = y';

m = inv(G)*data; % m is column vector (N+1 x 1)

xi = linspace(x(1),x(end),1000);

xi = xi';

yi = [m(1)*xi.^0 + m(2)*xi.^1 + m(3)*xi.^2 + m(4)*xi.^3 + m(5)*xi.^4];% (1000 x N+1) (N+1 x1) 

hold on;
plot(x,y,'o');
plot(xi,yi,'--');
hold off;

