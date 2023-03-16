% Get data to MATLAB
Data = xlsread('Data.xlsx');
return1 =0.3*Data(:,1);
return2 =0.7*Data(:,2);
dt=1/365.0;
S0=1;
r=mean(return1+return2);
sigma=(var(return1*100)+var(return2*100))/2;
expTerm=r*dt;
stddev=sigma*sqrt(dt);
nDays1=365;
for nDays=1:nDays1
nTrials=10000;      
for j=1:nTrials 
n = randn(1,nDays);
S=S0; 
for i=1:nDays 
dS = S*(expTerm+stddev*n(i));
S=S+dS;
end
S1(nDays,j)=S;
end
end
S2=mean(S1');
plot(S2','-o')
figure(2)
hist(S1(365,:),0:0.005:10)
k=0;
if S2<=0.9
    k=k+1
end
p=k/10000
