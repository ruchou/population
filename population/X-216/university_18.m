clear;
construct;


plot(X,S(1:43,19),'b-o',X(19:43),B(1:25,1),'r-^');
hold on
plot(X+18,B,'-.');
grid on
ylabel('No. of People at age 18');
xlabel('Year  Based on the year of tiger and the dragon');
legend('No. of People at age 18','Location','NorthEast','The birth rate 18 years ago','Location','NorthEast');
%legend(['No. of People under 25 (<25)fef',sprintf('\n'),'ehuf'],'Location','NorthEast')

year=0;
year(1)=1968;
i=2;
while year<2016
    year(i)=year(i-1)+2;
    i=i+1;
    year(i)=year(i-1)+10;
    i=i+1;
end



set(gca,'xtick',year);
