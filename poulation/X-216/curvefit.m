%
% Script file:  curvefit.m
% Curve fit for No. of People between 1975-2016 (42 years)
%
Data=xlsread('year90.xls','A1:B42');
X=Data(:,1);
Y=Data(:,2);
[P S]=polyfit(X,Y,2)
ymu=mean(Y);
Yh=P(1)*X.^2 + P(2)*X + P(3);
top=norm(Yh-ymu,2);
bot=norm(Y-ymu,2);
R2=(top*top)/(bot*bot)
plot(X,Y,'ro',X,Yh,'b-');
legend('R^2 Statistics = 0.9335','\itY=-0.2384\itX^2+2.6704\itX+2.1757',4);
title('Quadratic Curve Fitting')
% legend('Best fitting line is y=0.8822x+0.0298','Location','NorthWest')
% title('No. of People vs Year')
ylabel('Population of age over 90')
xlabel('Year')