function [mean_corr,std_corr] = correlation( x,t_wait,Dt,t_max)
% this function returns the time correlation averaged with respect to the
% particles( i.e. disorder average). std_corr is the standard deviation
% over N
%if in doubt, often a good choice is  t_wait=3500;
% anyway %t_wait has to be larger than N^(2/3)/(1-T);
N=size(x,1);
y=x(:,round(t_wait/Dt):end);% wait for thermalisation
t=round(size(y,2)/2);% this is the maximum time to observe a correlation
if t_max<t
    t=t_max
end
%clear corr;
for i=1:N
    corr(i,:)=xcorr(y(i,:),t,'unbiased');
end
corr=corr(:,ceil(end/2):end);
mean_corr=mean(corr,1);
std_corr=std(corr,1);
end

