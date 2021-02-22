function y = squaring(x)
y = x;

for i = 1:1:size(x,2)
    for j = 1:1:size(x,1)
        y(j,i) = x(j,i) ^ 2;
    end
end

end