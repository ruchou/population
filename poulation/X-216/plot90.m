%
% plot90.m - Population Data from 1974-2016 yearly
%
Data=xlsread('population1974-2016.xlsx','D6:DA134');
X=1974:2016;
A=Data(1:3:129,1:102);     % Number of people & total population
T=Data(1:3:129,1);         % Total Population in each year
B=Data(1:3:129,2);         % Number of births
S=Data(1:3:129,2:102);     % Number of people
for i=19:43
    n90=S(i,91);
    for j=92:101
        n90=n90+S(i,j);
    end
    S(i,91)=n90;
end
X1=(1975:2016)';
Y1=S(2:43,91);
Y2=100*(S(2:43,91)/T(2:43));
size(X1), size(Y1)
Out=[X1,Y1];
[sucess, message]=xlswrite('year90.xls',Out,'A1:B42');
%fout=fopen('year90.txt','w');
%for i=1:42
%  fprintf(fout,'%d\t%d\n',X1(i),Y1(i));
%end
%fclose(fout);
subplot(2,1,1)
plot(X1,Y1,'b-^');grid
legend('People of 90+ vs. Year','Location','NorthWest')
text(1975,13118,'17118');     % (1975, 17118)
text(2016,350000,'356386');   % (2016, 356386)
xlabel('Year')
ylabel('No. of People over 90')
title('No. of People over 90 from 1975 to 2016 Inclusively')
subplot(2,1,2)
bar(X1,Y2)
title('Percentage of people over 85 from 1975 - 2016')
%legend('Births vs. Year','Location','NorthWest')
% XC=[1986, 1998, 2010]; YC=[90000, 90000, 90000]; Msg=['Tiger'];
% text(XC,YC,Msg);
% text(1986,90000,'Tiger');text(1998,90000,'Tiger');
% text(2010,90000,'Tiger');
% legend('Births vs. Year','Location','NorthWest')
% xlabel('Year')
% ylabel('Number of Births')
% title('The Number of Births from 1981 to 2016 Inclusively')