%% figure 3
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig3');
raw_data = num;
currmean = mean(raw_data(:,1:6),1);
currsem = squeeze(std(raw_data(:,1:6)))/10;

figure
p1 = plot(currmean,'k:','linewidth',2);
hold on
errorbar(currmean,currsem,'k.')

currmean = mean(raw_data(:,7:12),1);
currsem = squeeze(std(raw_data(:,7:12)))/10;
p2 = plot(currmean,'k-','linewidth',2);
errorbar(currmean,currsem,'k.')
set(gca,'XTick',[1:6])
set(gca,'XTickLabel',2.^(1:6))
legend([p1,p2],{'L4C','L2/3'})
xlim([1,6])
ylabel('accuracy')
xlabel('number of sites')
box off
axis square

%% Supplementary figure 10
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig 10');
MSE_train = num(:,2);MSE_test = num(:,3);
ExpV_train = num(:,6);ExpV_test = num(:,7);

Lambda = num(:,1);
figure
subplot(1,2,1)
hold on
plot(Lambda,MSE_train,'r.-')
plot(Lambda,MSE_test,'k.-')
set(gca,'XScale','log')
xlabel('lambda')
ylabel('MSE')
subplot(1,2,2)
hold on
plot(Lambda,ExpV_train,'r.-')
plot(Lambda,ExpV_test,'k.-')
set(gca,'XScale','log')
xlabel('lambda')
ylabel('Explain variance')


%% Supplementary figure 11
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig 11');

figure
for ii = 1:2
    currdata = num(:,[1:4]+(ii-1)*2);
    currdatamean = mean(currdata);
    currsem = std(currdata)/sqrt(length(currdata));
    subplot(1,3,ii)
    p1 = bar([1],currdatamean(1),'edgecolor','r','facecolor','r');%,'facealpha',0.5)
    hold on
    p2 = bar([2],currdatamean(2),'edgecolor','r','facecolor','none');%,'facealpha',0.5)
    bar([4],currdatamean(3),'edgecolor','b','facecolor','b');%,'facealpha',0.5)
    bar([5],currdatamean(4),'edgecolor','b','facecolor','none');%,'facealpha',0.5)
    errorbar([1,2,4,5],currdatamean,currsem,'k.')
    legend([p1,p2],{'Linear decoder','LN decoder'})
    xlim([0,6])
    box off
    set(gca,'XTick',[1.5,4.5])
    set(gca,'XTickLabel',{'surface','edge'})
    if ii == 1
        ylabel('MSE of trainning set')
    else
        ylabel('MSE of cross validation set')
    end
end
subplot(1,3,3)
currdata = num(:,10:13);
currdatamean = mean(currdata);
currsem = std(currdata)/sqrt(length(currdata));
p1 = bar([1],currdatamean(1),'edgecolor','r','facecolor','r');%,'facealpha',0.5)
hold on
p2 = bar([2],currdatamean(2),'edgecolor','r','facecolor','none');%,'facealpha',0.5)
bar([4],currdatamean(3),'edgecolor','b','facecolor','b');%,'facealpha',0.5)
bar([5],currdatamean(4),'edgecolor','b','facecolor','none');%,'facealpha',0.5)
errorbar([1,2,4,5],currdatamean,currsem,'k.')
legend([p1,p2],{'Linear decoder','LN decoder'})
xlim([0,6])
box off
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'surface','edge'})
ylabel('accuracy')
