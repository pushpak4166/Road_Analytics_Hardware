function y = shuffle_data(data)

[r,c] = size(data);

y = zeros(r,c+1);
for i = 1:1:r
    y(i, :) = [data(i, :), rand];
end

[~,idx] = sort(y(:,c+1));
z = y(idx,:);

y = z(:, 1:c);
end