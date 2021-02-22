function y = derivative(x, Ts)
y = zeros(size(x));

for i = 1:1:size(x, 2)
    data = x(:,i);
    for j = 1:1:length(data)-1
        y(j,i) = (data(j+1) - data(j))/Ts;
    end
end

end