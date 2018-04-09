function x = steps(x0,T,tot_time,Dt,N,J,h,t_wait)
%SImulates the entire trajectory

N_iter=tot_time/Dt;
x(:,1)=x0;
tic
%t_wait=round(N/(1-T));
%t_wait=10000;
for i=2:t_wait/Dt
        z=randn(N,1)*sqrt(2*Dt*T);
        f=Dt*(J*x+h)+z;
        x_norm=norm(x)^2;
        %x_norm=N;
        xf=x'*f;
        x=x*(-xf/x_norm+sqrt((xf/x_norm)^2+(N-norm(f)^2)/x_norm))+f;
end

for i=2:N_iter
        z=randn(N,1)*sqrt(2*Dt*T);
        f=Dt*(J*x(:,i-1)+h)+z;
        x_norm=norm(x(:,i-1))^2;
        %x_norm=N;
        xf=x(:,i-1)'*f;
        x(:,i)=x(:,i-1)*(-xf/x_norm+sqrt((xf/x_norm)^2+(N-norm(f)^2)/x_norm))+f;
end
toc

end
