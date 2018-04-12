function [P1,f] = Fourier_transform(X,Dt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
L=length(X);
n = 2^nextpow2(L);
Y = fft(X,n);
P2 = abs(Y/n);
P1 = P2(1:n/2+1);
%P1(2:end-1) = 2*P1(2:end-1);
f = (0:(n/2))/n/Dt;
end

