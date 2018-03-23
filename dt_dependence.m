clear all;

%% Onset Conditions
% dimension:
N=3;
% correlation paramter:
eta=1.;
% amplitude
JAmp=1;
% Sparsity of J
Mdensity=0;
% Tot time 
tot_time=1000;
% Delta t:
Dt=0.5;
% Temperature: Increase it!!!
T=0.1;
% Initialise
J=zeros(N,N);
%x=zeros(N,N_tot);
% ICs
var_ICs_X=0.01;
x(:,1)=var_ICs_X*randn(N,1);
M=sum(x(:,1).^2);
% Fix the constraint sum x^2=N for all t
x(:,1)=x(:,1)*sqrt(N)/sqrt(M);

%% Generate Random Matrix:
if eta==0
    J=JAmp/sqrt(N)*randn(N);   
 % In case you want sparse:  
 % J=JAmp/sqrt(n)*sprandn(n,n,Mdensity);
J=J-diag(diag(J));
else
    a=sqrt(1-eta^2);
    a=sqrt((1-a)/2);
    b=eta/(2*a);    
    J=JAmp/sqrt(N)*randn(N);    
 % In case you want sparse:  
 % J=JAmp/sqrt(n)*sprandn(n,n,Mdensity);
    J=a*J+b*J';
    J=J-diag(diag(J));
end;
figure;
plot(real(eig(J)),imag(eig(J)),'o');hold on;grid on;
xlabel('Re(\lambda_J)');
ylabel('Im(\lambda_J)')
hold on;
%% run multiple time steps
%time steps are generated as Dt*2^-i for i \in {2,.. 14}
for i=1:14
    [C,m(i),s(i)]=step(Dt/(2^i),x,J,N,T,tot_time);
%plot(2+Dt:Dt:tot_time,C(find(mask>2)))% if you want to plot, wait for
%stationarity after 2
end
save('correlation')
