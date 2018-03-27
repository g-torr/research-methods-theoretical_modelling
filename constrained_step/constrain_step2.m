function [mu_thr,mu,f2,xfs]  =  constrain_step2(Dt,x,J,N,T,tot_time)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%% Time steps
N_tot=tot_time/Dt;

for i=1:N_tot
z=randn(N,1)*sqrt(2*Dt*T);
f=Dt*J*x+z;
%x_norm=norm(x)^2;
x_norm=N;
xf=x'*f;
mu_thr(i)=x'*f/N;%this is the mu_theory Dt 
mu(i)=1+(xf-sqrt(N^2+xf^2-N*norm(f)^2))/N;% mu simulation *Dt
x=x*(1-mu(i))+f;
f2(i)=norm(f)^2;
xfs(i)=xf;
end

end
