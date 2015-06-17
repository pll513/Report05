function result = sor(A,b,w,eps,kmax)
n = size(A,1);
x0 = zeros(1,n);
x1 = x0;
err = 1;
k = 0;
result = [0, x0];
while (err>eps && k<kmax)
    for i = 1:n
        sum = 0;
        for j = 1:i-1
            sum = sum + A(i,j)*x1(j);
        end
        for j = i+1:n
            sum = sum + A(i,j)*x0(j);
        end
        x1(i) = ((b(i)) - sum) / A(i,i);
        x1(i) = w*x1(i) + (1-w)*x0(i);
    end
    err = max(abs(x1-x0));
    x0 = x1;
    k = k + 1;
    result = [result;[k,x1]];
end