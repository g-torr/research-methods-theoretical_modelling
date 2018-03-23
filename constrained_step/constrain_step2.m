function [C ] =  constrain_step2(Dt,x,J,N,T,tot_time)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%% Time steps
N_tot=tot_time/Dt;

for i=1:N_tot
z=randn(N,1)*sqrt(2*Dt*T);
f=Dt*J*x+z;
x_norm=norm(x)^2;
%x_norm=N;
xf=x'*f;

x=x*(-xf/x_norm+sqrt((xf/x_norm)^2+(N-norm(f)^2)/x_norm))+f;

C(i=norm(x)^2;
end

end
