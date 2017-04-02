%
% ageplot.m - Population Data from 1974-2015 yearly
%
Data=xlsread('population1974-2016.xlsx','D6:DA131');
X=1974:2015;
A=Data(1:3:124,1:102);     
B=Data(1:3:124,2);         % Number of births
S=Data(1:3:124,2:87);
size(A)
B=Data(1:3:124,2);
for i=2:18
    n85=S(i,86);
    for j=1:5
        n85=n85+A(i,87+j);
    end
    S(i,86)=n85;
end
for i=19:42
    n85=S(i,86);
    for j=1:15
        n85=n85+A(i,87+j);
    end
    S(i,86)=n85;
end
Y=S(:,86);
plot(X,Y,'b-^');grid
legend('People of 85+ vs. Year','Location','NorthWest')
text(2013,341166,'341166');
text(1972,17118,'17118');
xlabel('Year')
ylabel('Number of People')
title('The Number of People over 85 from 1974 to 2015 Inclusively')
%legend('Births vs. Year','Location','NorthWest')
% XC=[1986, 1998, 2010]; YC=[90000, 90000, 90000]; Msg=['Tiger'];
% text(XC,YC,Msg);
% text(1986,90000,'Tiger');text(1998,90000,'Tiger');
% text(2010,90000,'Tiger');
% legend('Births vs. Year','Location','NorthWest')
% xlabel('Year')
% ylabel('Number of Births')
% title('The Number of Births from 1981 to 2015 Inclusively')