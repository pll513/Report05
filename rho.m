function rho = rho(A,w)
format long;
m = size(w,2);
n = size(A,1);
rho = zeros(1,m);
Diag = zeros(n);
L = zeros(n);
U = zeros(n);
E = eye(n);

for i = 1:n
   Diag(i,i) = A(i,i); 
end

for i = 1:n
   for j = 1:n 
       if j < i
           L(i,j) = -A(i,j);
       end
       if j > i
           U(i,j) = -A(i,j);
       end
   end
end


for i = 1:m
    rho(i) = max(abs(eig(E/(Diag - w(i)*L)*((1 - w(i))*Diag + w(i)*U))));
end
