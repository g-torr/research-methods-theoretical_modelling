function [x] = step(Dt,x,J,N,T,tot_time)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%% Time steps
N_tot=tot_time/Dt;
%saving_time=1./(2*T*Dt);% it saves configuration every1/2T
%j=2;%saving index
for i=2:N_tot
    z=randn(N,1)*sqrt(2*Dt*T);
    f=Dt*J*x(:,i-1)+z;
    mu=x(:,i-1)'*f/N;
    x(:,i)=x(:,i-1)*(1-mu)+f;
    %x(:,i)=x(:,i-1)+Dt*(-x(:,i-1)/N*(x'*J*x)+J*x)+(eye(N)-1/N*x*x')*randn(N,1)*sqrt(2*Dt*T);
end
%{if (mod(i,saving_time)==0) C(j)=x(:,i)'*x(:,i);
%end;

end

