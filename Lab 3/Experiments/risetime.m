function [time] = risetime(data, time_array, target)
count = 1;
max_cnt = length(data);
while count < max_cnt && data(count) < 0.9*target
    count = count + 1;
    
end
time = time_array(count);
end