%
% plot25to65.m - Study on Population Data from 1974-2016 yearly
%
Data=xlsread('population1974-2016.xlsx','D6:DA134');
X=1974:2016;
A=Data(1:3:129,1:102);  
T=Data(1:3:129,1);         % Total Population
B=Data(1:3:129,2);         % Number of births
S=Data(1:3:129,2:102);
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
% R25(1:43) - number of people under age 25 from 1974-2016
subplot(2,2,1)
plot(X,R25,'c-o');grid
text(1974,9351801,'9351801');    % (1974, 9351801/15927167)
text(2016,6184806,'6184806');    % (2016, 6184806/23539816)
xlabel('Year')
ylabel('No. of People under 25')
title(' from 1974 to 2016 Inclusively')
%
% Population of age over 65 years old inclusively
R65=zeros(43,1);
n65=S(1,86);
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
% R65(1:43) - number of people of age at least 65
subplot(2,2,2)
plot(X,R65,'m-^');grid
legend('People of 65+ vs. Year','Location','NorthWest')
text(1974,537331,'537331');    % (1974,  537331/15927167)
text(2016,3106105,'3106105');  % (2016, 3106105/23539816)
xlabel('Year')
ylabel('No. of People at least 65')
title('No. of People over 65 from 1974 to 2016 Inclusively')
subplot(2,2,3)
Y2=(T-R25)-R65;
plot(X,Y2,'b-+'); grid
legend('No. of workforce','Location','NorthWest')
[Y2(1), Y2(43)]
text(1974,6038035,'6038035');    % (1974,  6038035/15927167)
text(2016,14248905,'14248905');  % (2016, 14248905/23539816)
title('No. of people in [25,65)')
xlabel('Year')
ylabel('No. of working people')
RY2=100*(Y2./T);
subplot(2,2,4)
bar(X,RY2)
title('Distribution of No. of people in [25,65)')