%% figure 7
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig7');
figure
for ii = 1:4
currdata = num(:,[1:2]+(ii-1)*2);
% currdata = raw_data(:,1:2);
currdatamean = squeeze(mean(currdata,1));
currstd = squeeze(std(currdata,[],1))/sqrt(50);

plot(1+(rand(1,50)-0.5)/2+(ii-1)*3,squeeze(currdata(:,1)),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,50)-0.5)/2+(ii-1)*3,squeeze(currdata(:,2)),'.','color',[1,1,1]*0.5)

bar([1]+(ii-1)*3,currdatamean(1),'edgecolor','r','facecolor','none');%,'facealpha',0.5)
hold on
bar([2]+(ii-1)*3,currdatamean(2),'edgecolor','b','facecolor','none');%,'facealpha',0.5)
errorbar([1,2]+(ii-1)*3,currdatamean,currstd,'k.')
end

ylim([50,100])
xlim([0,12])
box off
set(gca,'XTick',1.5:3:11)
set(gca,'XTickLabel',{'L4C data','simulation (excitation)', ...
    'simulation (inhinition)','L2/3 data'})
ylabel('accuracy')