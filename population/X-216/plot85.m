%
% plot85.m - Population Data from 1974-2016 yearly
%
Data=xlsread('population1974-2016.xlsx','D6:DA134');
X=1974:2016;
A=Data(1:3:129,1:102);     % Number of people & total population
T=Data(1:3:129,1);         % Total Population in each year
B=Data(1:3:129,2);         % Number of births
S=Data(1:3:129,2:102);     % Number of people
for i=2:18
    n85=S(i,86);
    for j=87:91
        n85=n85+S(i,j);
    end
    S(i,86)=n85;
end
for i=19:43
    n85=S(i,86);
    for j=87:101
        n85=n85+S(i,j);
    end
    S(i,86)=n85;
end
Y=S(:,86);
Y2=100*(Y./T);
[Y(1), Y(43)]
subplot(2,1,1)
plot(X,Y,'b-^');grid
legend('People of 85+ vs. Year','Location','NorthWest')
text(1972,13118,'17118');     % (1974, 17118)
text(2016,350000,'356386');   % (2016, 356386)
xlabel('Year')
ylabel('No. of People over 85')
title('No. of People over 85 from 1974 to 2016 Inclusively')
subplot(2,1,2)
bar(X,Y2)
title('Percentage of people over 85 from 1974 - 2016')
%legend('Births vs. Year','Location','NorthWest')
% XC=[1986, 1998, 2010]; YC=[90000, 90000, 90000]; Msg=['Tiger'];
% text(XC,YC,Msg);
% text(1986,90000,'Tiger');text(1998,90000,'Tiger');
% text(2010,90000,'Tiger');
% legend('Births vs. Year','Location','NorthWest')
% xlabel('Year')
% ylabel('Number of Births')
% title('The Number of Births from 1981 to 2016 Inclusively')