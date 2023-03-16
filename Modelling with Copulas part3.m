figure(1);
Data = xlsread('Data.xlsx');
return1 =0.3*Data(:,1);
return2 =0.7*Data(:,2);
u1 = ksdensity(return1,return1,'function','cdf');
u2 = ksdensity(return2,return2,'function','cdf');

rng default
tau = -0.5;
rho = copulaparam('Gaussian',tau)
u = copularnd('gaussian',rho,100);
scatterhist(u1,u2)
xlabel('u1')
ylabel('u2')
saveas(figure(1),'gaussian copulafit')

figure(2);
rng default
[rho,nu] = copulafit('t',[u1 u2],'Method','ApproximateML')
scatterhist(u1,u2)
xlabel('u1')
ylabel('u2')
saveas(figure(2),'T copulafit')