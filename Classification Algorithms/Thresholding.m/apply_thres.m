function [t, g, r] = apply_thres(data, T)

conf = zeros(2,2);

for i = 1:1:length(data)
    pred = zeros(1,size(data,2)-1);
    for r = 1:1:size(data,2)-1
        if (data(i,r) >= T(1,r))
            pred(1,r) = 2;
        else
            pred(1,r) = 1;
        end
    end
    true = data(i,r+1);
    prediction = mode(pred);
    conf(true, prediction) = conf(true, prediction) + 1;
end

disp('');
disp('Calculating accuracy');

disp(conf);
disp('');

y = (trace(conf)/sum(conf, 'all'))*100;

con = conf;

con(1,1) = conf(1,1)/(conf(1,1) + conf(1,2));
con(2,1) = conf(2,1)/(conf(2,1) + conf(2,2));
con(1,2) = conf(1,2)/(conf(1,1) + conf(1,2));
con(2,2) = conf(2,2)/(conf(2,1) + conf(2,2));

con = con * 100;
disp(con);

t = y;
g = con(1,1);
r = con(2,2);

end