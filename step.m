function [C, mean_C,std_C ] = step(Dt,x,J,N,T,tot_time)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%% Time steps
N_tot=tot_time/Dt;
%saving_time=1./(2*T*Dt);% it saves configuration every1/2T
%j=2;%saving index
for i=2:N_tot

x=x+Dt*(-x/N*(x'*J*x)+J*x)+(eye(N)-1/N*x*x')*randn(N,1)*sqrt(2*Dt*T);
C(i)=x'*x;
end
%{if (mod(i,saving_time)==0) C(j)=x(:,i)'*x(:,i);
%end;
mask=(0:N_tot-1)*Dt;
temp=C(find(mask>2));
mean_C=mean(temp);
std_C=std(C(find(mask>2)));
end

