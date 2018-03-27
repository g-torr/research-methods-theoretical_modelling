function [mu_thr,mu ] =  constrain_step(Dt,x,J,N,T,tot_time)

%function [store,mu_thr,mu ] =  constrain_step(Dt,x,J,N,T,tot_time)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%% Time steps
N_tot=tot_time/Dt;
%store=zeros(N_tot,N);
%saving_time=1./(2*T*Dt);% it saves configuration every1/2T
%j=2;%saving index
for i=1:N_tot
z=randn(N,1)*sqrt(2*Dt*T);
f=Dt*J*x+z;
xold=x;
%x_norm=norm(x)^2;
x_norm=N;
B=1+x'*f/x_norm;
%D=1+(f'*(2*x+f)-N)/x_norm;  %this is the exact version, but it is weak numerically 
D=(f'*(2*x+f))/x_norm;
mu(i)=(B-sqrt(B^2-D));%this is the mu * Dt term

x=(1-mu(i))*x+f;
mu_thr(i)=xold'*f/N;%this is the mu_theory Dt 
%mu(i)=mu(i);
%store(i,:)=x;
end

end
