function q = EA_parameter(x,Dt)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N=size(x,1);
%t_wait=N^(2/3)/(1-T);
t_wait=5000;
y=x(:,round(t_wait/Dt):end);% wait for thermalisation
t=round(size(y,2)/2);% this is the maximum time to observe a correlation
corr=0;
for i=1:size(y,1)
    corr=corr+xcorr(y(i,:),t,'unbiased');
end
corr=corr(ceil(end/2):end)/N;
q=mean(corr(end-1000:end))
end

