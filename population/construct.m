%construct rhe data 
Data=xlsread('population1974-2016.xlsx','D6:DA134');
X=1974:2016;
A=Data(1:3:129,1:102);  
T=Data(1:3:129,1);         % Total Population
B=Data(1:3:129,2);         % Number of births -> 0 year old
S=Data(1:3:129,2:102);     % Number of people -> 0 ->all age