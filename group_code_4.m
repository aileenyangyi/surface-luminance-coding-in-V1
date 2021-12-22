%% figure 4
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig4');

%%%% figure 4b
currdata = num(:,1:4);
% currdata = raw_data(:,1:2);
currdata1 = currdata;currdata1(currdata<60) = 60;
currdatamean = squeeze(mean(currdata,1));
currstd = squeeze(std(currdata,[],1))/10;

figure
subplot(2,4,3)
plot(1+(rand(1,100)-0.5)/2,squeeze(currdata1(:,1)),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,100)-0.5)/2,squeeze(currdata1(:,2)),'.','color',[1,1,1]*0.5)
plot(4+(rand(1,100)-0.5)/2,squeeze(currdata1(:,3)),'.','color',[1,1,1]*0.5)
plot(5+(rand(1,100)-0.5)/2,squeeze(currdata1(:,4)),'.','color',[1,1,1]*0.5)

bar([1],currdatamean(1),'edgecolor','r','facecolor','none');%,'facealpha',0.5)
hold on
bar([2],currdatamean(2),'edgecolor','b','facecolor','none');%,'facealpha',0.5)
bar([4],currdatamean(3),'edgecolor','r','facecolor','none');%,'facealpha',0.5)
bar([5],currdatamean(4),'edgecolor','b','facecolor','none');%,'facealpha',0.5)
errorbar([1,2,4,5],currdatamean,currstd,'k.')
ylim([60,100])
xlim([0,6])
box off

%%%% figure 4c
raw_data = num(:,6:17);
currmean = mean(raw_data(:,1:6),1);
currsem = squeeze(std(raw_data(:,1:6)))/10;

subplot(2,4,4)
p1 = plot(currmean,'k:','linewidth',2);
hold on
errorbar(currmean,currsem,'k.')

currmean = mean(raw_data(:,7:12),1);
currsem = squeeze(std(raw_data(:,7:12)))/10;
p2 = plot(currmean,'k-','linewidth',2);
errorbar(currmean,currsem,'k.')
plot(currmean*0,'k--','linewidth',2);
set(gca,'XTick',[1:6])
set(gca,'XTickLabel',2.^(1:6))
legend([p1,p2],{'L4C','L2/3'})
xlim([1,6])
ylim([-15,10])
ylabel('accuracy difference (E-S)')
xlabel('number of sites')
box off
axis square

%%%% figure 4d

clear usecolor
usecolor{1,1} = [1,1,1]*0.7;
usecolor{1,2} = [1,1,1]*0;
usecolor{2,1} = 'none';
usecolor{2,2} = 'none';
for ii = 1:2
    if ii ==1
currdata = num(:,19:22);
    elseif ii==2
    currdata = num(:,23:26);
    end
currdatamean = mean(currdata);
currsem = std(currdata)/10;
subplot(2,5,ii+5)
plot(1+(rand(1,100)-0.5)/2,squeeze(currdata(:,1)),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,100)-0.5)/2,squeeze(currdata(:,2)),'.','color',[1,1,1]*0.5)
plot(4+(rand(1,100)-0.5)/2,squeeze(currdata(:,3)),'.','color',[1,1,1]*0.5)
plot(5+(rand(1,100)-0.5)/2,squeeze(currdata(:,4)),'.','color',[1,1,1]*0.5)

bar([1],currdatamean(1),'edgecolor',[1,1,1]*0.7,'facecolor',usecolor{ii,1},'facealpha',0.5)
hold on
bar([2],currdatamean(2),'edgecolor','k','facecolor',usecolor{ii,2},'facealpha',0.5)
bar([4],currdatamean(3),'edgecolor',[1,1,1]*0.7,'facecolor',usecolor{ii,1},'facealpha',0.5)
bar([5],currdatamean(4),'edgecolor','k','facecolor',usecolor{ii,2},'facealpha',0.5)
errorbar([1,2,4,5],currdatamean,currsem,'k.')
ylim([60,100])
xlim([0,6])
box off
set(gca,'YTick',[60:10:100])
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'L4C','L2/3'})
xlim([0,6])
ylim([60,100])
end

%%%% figure 4e
currdata = num(:,28:31);
usecolor{1,1} = 'r';
usecolor{1,2} = 'none';
currdatamean = mean(currdata);
currsem = std(currdata)/10;
subplot(2,5,8)
plot(1+(rand(1,100)-0.5)/2,squeeze(currdata(:,1)),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,100)-0.5)/2,squeeze(currdata(:,2)),'.','color',[1,1,1]*0.5)
plot(4+(rand(1,100)-0.5)/2,squeeze(currdata(:,3)),'.','color',[1,1,1]*0.5)
plot(5+(rand(1,100)-0.5)/2,squeeze(currdata(:,4)),'.','color',[1,1,1]*0.5)

bar([1],currdatamean(1),'edgecolor','r','facecolor',usecolor{1,1},'facealpha',0.5)
hold on
bar([2],currdatamean(2),'edgecolor','r','facecolor',usecolor{1,2},'facealpha',0.5)
bar([4],currdatamean(3),'edgecolor','r','facecolor',usecolor{1,1},'facealpha',0.5)
bar([5],currdatamean(4),'edgecolor','r','facecolor',usecolor{1,2},'facealpha',0.5)
errorbar([1,2,4,5],currdatamean,currsem,'k.')
ylim([60,100])
xlim([0,6])
box off
set(gca,'YTick',[60:10:100])
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'L4C','L2/3'})
xlim([0,6])
ylim([60,100])


%%%% figure 4f

currdata = num(:,28:31);
subfig_pos = [14,15,19,20];
usecolor = [0.7,0.7,0.7;0,0,0;0.7,0.7,0.7;0,0,0];
for ii = 1:4
    
    currdata = num(:,[33:34]+(ii-1)*2);
    currid = find(~isnan(currdata(:,1)));
    currdata = currdata(currid,:);
            subplot(4,5,subfig_pos(ii))
        plot(currdata(:,1),currdata(:,2),['.'],'color',usecolor(ii,:),'markersize',10)
        [r,p] = corrcoef(currdata(:,1),currdata(:,2));
        if p(2)<0.05*100
            title(['r=',num2str(round(r(2)*100)/100),...
                ' p=',num2str(round(p(2)*100)/100)])
        end
%         set(gca,'color',[1,1,1]*0.5)
        box off
        axis square
        axis([0,1,-1,1])


end
%% Supplementary figure 5
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig 5');
timepoint = num(:,1);
figure
for ii = 1:2
    currdata = num(:,[2:4]+(ii-1)*4);
    subplot(1,2,ii)
    hold on;
    p1 = plot(timepoint,currdata(:,1),'r')
    p2 = plot(timepoint,currdata(:,2),'b')
    p3 = plot(timepoint,currdata(:,3),'k')
    plot(timepoint,currdata(:,1)*0+33,'k')
    xlabel('time(ms)')
    ylabel('accuracy')
    ylim([20,100])
    xlim([-20,260])
end
legend([p1,p2,p3],{'surface decoder','edge decoder','mix decoder'})

%% Supplementary figure 6

[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig6 ');
figure
subplot(1,2,1)
currdata = num(:,5:8);
currdatamean = mean(currdata)+1;
currstd = std(currdata);

p1 = bar([1],currdatamean(1),'edgecolor','r','facecolor','r','facealpha',0.8)
hold on
p2 = bar([2],currdatamean(2),'edgecolor','b','facecolor','b','facealpha',0.2)
bar([4],currdatamean(3),'edgecolor','r','facecolor','r','facealpha',0.8)
bar([5],currdatamean(4),'edgecolor','b','facecolor','b','facealpha',0.2)
errorbar([1,2,4,5],currdatamean,currstd,'k.')
plot([0,6],[1,1],'k--')
legend([p1,p2],{'surface resp. (high contrast)','edge resp. (low contrast'})
xlim([0,6])
set(gca,'YTick',[-0.8:0.4:0.8]+1)
set(gca,'YTickLabel',[-0.8:0.4:0.8])

box off
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'white','black'})
ylabel('predicted luminance')

subplot(1,2,2)
currdata = num(:,9:12);
currid = find(~isnan(currdata(:,1)));
currdata = currdata(currid,:);
currdatamean = mean(currdata);
currstd = std(currdata);

p1 = bar([1],currdatamean(1),'edgecolor','r','facecolor','r','facealpha',0.8)
hold on
p2 = bar([2],currdatamean(2),'edgecolor','b','facecolor','b','facealpha',0.2)
bar([4],currdatamean(3),'edgecolor','r','facecolor','r','facealpha',0.8)
bar([5],currdatamean(4),'edgecolor','b','facecolor','b','facealpha',0.2)
errorbar([1,2,4,5],currdatamean,currstd,'k.')
xlim([0,6])
ylim([0,0.18])
box off
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'white','black'})
ylabel('population activity')


