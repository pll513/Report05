%Lab05
clear; clc;

Emax = zeros(1,5);
Count = zeros(1,5);

disp('*********************************************************');
disp('*                          SOR                          *');
disp('*********************************************************');
N = [2,3,4,5,6];
W = zeros(1,5);
R = zeros(1,5);
w = linspace(0,2,100000);


for i = 1:5
    H = generateMatrixHilbert(N(i));
    r = rho(H,w);
    W(i) = w(find(r==min(r),1));
    R(i) = min(r);
end
disp([W;R]);

H = generateMatrixHilbert(N(4));
result = sor(H,H*ones(5,1),W(4),10^-6,16000);
[m,n] = size(result);
count = m - 1;
emax = max(abs(result(m,2:n)-ones(1,n-1)));
fprinf('%d\n',N(4));
fprinf('%f\n',count);
fprinf('%f\n\n',emax);

N = [10,20,40,60,80];

for i = 1:5
    H = generateMatrixHilbert(N(i));
    x = ones(N(i),1);
    b = H * x;
    result = sor(H,b,0.3,10^-6,16000);
    [m,n] = size(result);
    Count(i) = m - 1;
    Emax(i) = max(abs(result(m,2:n)-ones(1,n-1)));
end
displayResult(N,Count,Emax);

CountMax = [10000,10000,16000,16000,15000];
for i = 1:5
    H = generateMatrixHilbert(N(i));
    x = ones(N(i),1);
    b = H * x;
    result = sor(H,b,1.0,10^-6,CountMax(i));
    [m,n] = size(result);
    Count(i) = m - 1;
    Emax(i) = max(abs(result(m,2:n)-ones(1,n-1)));
end
displayResult(N,Count,Emax);

for i = 1:5
    H = generateMatrixHilbert(N(i));
    x = ones(N(i),1);
    b = H * x;
    result = sor(H,b,1.5,10^-6,CountMax(i));
    [m,n] = size(result);
    Count(i) = m - 1;
    Emax(i) = max(abs(result(m,2:n)-ones(1,n-1)));
end
displayResult(N,Count,Emax);

disp('********************************************************');
disp('*                          CG                          *');
disp('********************************************************');
N = [40,80,200,500,1000];

for i = 1:5
    H = generateMatrixHilbert(N(i));
    x = ones(N(i),1);
    b = H * x;
    result = cg(H,b,10^-8,1000);
    [m,n] = size(result);
    Count(i) = m - 1;
    Emax(i) = max(abs(result(m,2:n)-ones(1,n-1)));
end
displayResult(N,Count,Emax);

