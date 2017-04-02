%
% plot65.m - Study on Population Data from 1974-2016 yearly
%
Data=xlsread('population1974-2016.xlsx','D6:DA134');
X=1974:2016;
A=Data(1:3:129,1:102);  
T=Data(1:3:129,1);         % Total Population
B=Data(1:3:129,2);         % Number of births
S=Data(1:3:129,2:102);
size(A)
B=Data(1:3:129,2);
%
% Population over 65 years old inclusively
n65=S(1,86);
for j=66:85
    n65=n65+S(1,j);
end
S(1,66)=n65;
for i=2:18
    n65=S(i,66);
    for j=67:91
        n65=n65+S(i,j);
    end
    S(i,66)=n65;
end
for i=19:43
    n65=S(i,66);
    for j=67:101
        n65=n65+S(i,j);
    end
    S(i,66)=n65;
end
X1=1974:2016;
Y1=S(1:43,66);
R1=100*(S(:,66)./T);
[S(1,66),T(1)]
[S(43,66), T(43)]
subplot(2,1,1)
plot(X1,Y1,'b-^');grid
legend('People of 65+ vs. Year','Location','NorthWest')
text(1974,537331,'537331');    % (1974,  537331/15927167)
text(2016,3106105,'3106105');  % (2016, 3392403/23539816)
xlabel('Year')
ylabel('No. of People over 65')
title('No. of People over 65 from 1974 to 2016 Inclusively')
subplot(2,1,2)
bar(X1,R1)
%legend('Births vs. Year','Location','NorthWest')
% XC=[1986, 1998, 2010]; YC=[90000, 90000, 90000]; Msg=['Tiger'];
% text(XC,YC,Msg);
% text(1986,90000,'Tiger');text(1998,90000,'Tiger');
% text(2010,90000,'Tiger');
% legend('Births vs. Year','Location','NorthWest')
% xlabel('Year')
% ylabel('Number of Births')
% title('The Number of Births from 1981 to 2016 Inclusively')
%