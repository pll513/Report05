function displayResult(X,Y,Z)
n = size(X,2);
for i = 1:n
    fprintf('%8d\t',X(i));
end
fprintf('\n');
for i = 1:n
    fprintf('%8d\t',Y(i));
end
fprintf('\n');
for i = 1:n
    fprintf('%f\t',Z(i));
end
fprintf('\n\n');