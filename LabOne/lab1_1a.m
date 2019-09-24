function [c,t] = lab1_1(np)
if (nargin < 1)
   np = 1e6;
end

nd = 2;
A = randn(np,nd);
B = randn(np,nd);
c = zeros(np,1);

tic;
for i=1:np
    for j= 1:nd
        c(i) = c(i) + (B(i,j)-A(i,j)).^2;
    end
    c(i) = sqrt(c(i));
end
t = toc;