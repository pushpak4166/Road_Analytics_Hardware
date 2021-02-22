function y = filtering(x, W)

for i = 1:1:size(x,2)
    y(:,i) = movmean(x(:,i),[W/2 (W/2)-1]);
end

end