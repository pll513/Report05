function result = cg(A,b,eps,kmax)
n = size(A,1);
x = zeros(1,n);
r = (b - A * x')';
rho0 = r * r';
rho1 = rho0;
k = 0;
result = [0,x];

while (sqrt(rho1)>eps && k<kmax)
    k = k + 1;
    if (k==1)
       p = r;
       beta = rho1/rho0;
    else
       p = r + beta * p;
    end
    w = A * p';
    alpha = rho1/(p * w);
    x = x + alpha * p;
    r = r - alpha * w';
    rho0 = rho1;
    rho1 = r * r';
    result = [result;[k,x]];
end