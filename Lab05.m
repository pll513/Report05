%Lab05
clear; clc;

N = [2,3,4,5,6];
W = zeros(1,5);
R = zeros(1,5);
w = linspace(0,2,10000);

for i = 1:5
    H = generateMatrixHilbert(N(i));
    rho = rho(H,w);
    W(i) = w(find(rho==min(rho),1));
    R(i) = min(rho);
end
disp(W);
disp(R);


