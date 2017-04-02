%
% plot25.m - Study on Population Data from 1974-2016 yearly
%
%plot people under 25
%plot people [25 65)
%plot people over 65

%D2:DA4，其中 D:DA 代表直行，而 6:134 代表橫列。
Data=xlsread('population1974-2016.xlsx','D6:DA134');
X=1974:2016;
A=Data(1:3:129,1:102);  
T=Data(1:3:129,1);         % Total Population
B=Data(1:3:129,2);         % Number of births -> 0 year old
S=Data(1:3:129,2:102);     % Number of people -> 0 ->all age
%
% Population under 25 years old, i.e.,  Age in [0, 25)
R25=zeros(43,1);
for i=1:43
    n25=S(i,1);
    for j=2:25
        n25=n25+S(i,j);
    end
    R25(i)=n25;
end
%percentage
R1=100*(R25./T);
[R25(1), T(1)]
[R25(43), T(43)]
subplot(3,2,1)
plot(X,R25,'b-o');grid
legend('No. of People under 25 (<25)','Location','NorthEast')
text(1974,9351801,'9351801');    % (1974, 9351801/15927167)
text(2016,6184806,'6184806');    % (2016, 6184806/23539816)
xlabel('Year')
ylabel('No. of People under 25')
title(' from 1974 to 2016 Inclusively')
set(gca,'xtick',[1974:5:2016]);
grid on
subplot(3,2,2)
bar(X,R1)
%
% Population of age over 65 years old inclusively
R65=zeros(43,1);
n65=S(1,86);
S(1,66:86)
for j=66:85
  n65=n65+S(1,j);
end
R65(1)=n65;
for i=2:18
    n65=S(i,66);
    for j=67:91
        n65=n65+S(i,j);
    end
    R65(i)=n65;
end
for i=19:43
    n65=S(i,66);
    for j=67:101
        n65=n65+S(i,j);
    end
    R65(i)=n65;
end
R2=100*(R65./T);
[R65(1),  T(1)]
[R65(43), T(43)]
subplot(3,2,3)
plot(X,R65,'b-^');grid
legend('People of 65+ vs. Year','Location','NorthWest')
text(1974,537331,'537331');    % (1974,  537331/15927167)
text(2016,3106105,'3106105');  % (2016, 3106105/23539816)
xlabel('Year')
ylabel('No. of People at least 65')
title('No. of People over 65 from 1974 to 2016 Inclusively')
subplot(3,2,4)
bar(X,R2)

%Population between 25 to 65 [25,65)
R25_65=zeros(43,1);
for i=1:43
    n25_65=S(i,26);
    for j=27:65
        n25_65=n25_65+S(i,j);
    end
    R25_65(i)=n25_65;
end

%percentage
R3=100*(R25_65./T);
[R25_65(1), T(1)]
[R25_65(43), T(43)]

subplot(3,2,5)
plot(X,R25_65,'b-^');
grid on
legend('No. of workforce','Location','NorthWest')

text(1974,6038035,'6038035');    % (1974,  6038035/15927167)
text(2016,14248905,'14248905');  % (2016, 14248905/23539816)


xlabel('Year')
ylabel('No. of Working people ')
title('No. of people in [25,65)')
subplot(3,2,6)
bar(X,R3);


figure;

%plot people over 100
R_over_100=zeros(43,1);
for i=1:43
    R_over_100(i)=S(i,101);
end


%percentage
R4=100*(R_over_100./T);
[R_over_100(1), T(1)]
[R_over_100(43), T(43)]

%curve fit
[P S]=polyfit(X(19:43)',R_over_100(19:43),2);
ymu=mean(R_over_100(19:43));

[Yh delta]=polyval(P,X,S);
top=norm(Yh(19:43)-ymu,2);
bot=norm(R_over_100(19:43)-ymu,2);
R2=(top*top)/(bot*bot)



subplot(2,2,1)
plot(X,R_over_100,'b-^',X,Yh,'r--o');
grid on
legend('No. of people over 100','Location','NorthWest','R^2 Statistics = 0.9854','\itY=1.549\itX^2-3.713766138975699e+05\itX+ 5.982e+06')

%text(1974,no,'6038035');    % (1974,  6038035/15927167)
text(2016,3068,'14248905');  % (2016, 14248905/23539816)

xlabel('Year')
ylabel('No. of people over 100')
title('No. of people over 100 from 1974 to 2016 Inclusively')
subplot(2,2,2)
bar(X,R_over_100);









