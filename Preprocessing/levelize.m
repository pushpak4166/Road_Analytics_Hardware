function y = levelize(x)

for i = 1:1:size(x,2)
    x(:,i) = x(:,i) - mean(x(:,i));
end
y = x;

end