% Get data to MATLAB
Data = xlsread('Data.xlsx');
return1 =0.3*Data(:,1);
return2 =0.7*Data(:,2);
r=mean(return1+return2);
sigma=(var(return1)+var(return2))/2;
x=r-1.645.*sqrt(sigma)