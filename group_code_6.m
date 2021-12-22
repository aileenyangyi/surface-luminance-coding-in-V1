%% figure 6
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig6');

%%%% figure 6b
currdata = num(:,1:6);
currdata = reshape(currdata,[45,2,3]);
currdata1 = currdata;
currdata1(currdata<0) = 0;
usecolor = 0.3*ones(3,3);
label = {'square edge','square surface','frame edge'};

figure
for ii = 1:3
        subplot('Position',[0.45+(ii-1)*0.18,0.7,0.12,0.12])
   
        plot(currdata1(:,1,ii),currdata1(:,2,ii),'.','color',usecolor(ii,:),'markersize',10)
    hold on
    plot([0,1],[0,1],'k')
    box off
    text(0.2,0.1,label{ii})
    xlabel({'goodness of fit','model A'})
if ii==1
    ylabel({'goodness of fit','model B'})
end
    subplot('Position',[0.45+(ii-1)*0.18,0.83-(2-k)*0.3,0.12,0.03])

    [b,h] = hist(currdata(:,1,ii),[0:0.05:1]);
    bar(h,b,'facecolor',usecolor(ii,:))
    box off
    ylim([0,10])
    set(gca,'XTick',[-999])
    subplot('Position',[0.58+(ii-1)*0.18,0.7-(2-k)*0.3,0.03,0.12])
    [b,h] = hist(currdata(:,2,ii),[0:0.05:1]);
    bar(h,b,'facecolor',usecolor(ii,:))
    view(90,-90)
    box off
    set(gca,'XTick',[-999])
end

%%%% figure 6c

currdata = num(:,8:10);
currdata1 = currdata;
currdata1(currdata<0) = 0;
currdata1(currdata>0.6) = 0.6;

subplot('Position',[0.45+0*0.18,0.4,0.13,0.15])

plot(1+(rand(1,45)-0.5)/2,currdata1(:,2),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,45)-0.5)/2,currdata1(:,1),'.','color',[1,1,1]*0.5)
plot(3+(rand(1,45)-0.5)/2,currdata1(:,3),'.','color',[1,1,1]*0.5)
bar([2,1,3],mean(currdata, 1),'facecolor','none','edgecolor',[0,0,0]);%usecolor(1,:))
errorbar([2,1,3],mean(currdata,1),std(currdata,[],1)/sqrt(length(currdata)),'k.')
box off
ylabel({'goodness of fit','model B-model A'})

%%%% figure 6d

currdata = num(:,12:14);
subplot('Position',[0.45+1*0.18,0.4,0.13,0.15])

plot(1+(rand(1,45)-0.5)/2,currdata(:,1),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,45)-0.5)/2,currdata(:,2),'.','color',[1,1,1]*0.5)
plot(3+(rand(1,45)-0.5)/2,currdata(:,3),'.','color',[1,1,1]*0.5)
bar(1:3,mean(currdata, 1),'facecolor','none','edgecolor',[0,0,0]);%usecolor(1,:))
errorbar(1:3,mean(currdata,1),std(currdata,[],1)/sqrt(length(currdata)),'k.')
box off
ylabel({'Index of ','surface suppression'})
ylim([0,1.2])

%%%% figure 6e

currdata = num(:,16:18);
subplot('Position',[0.45+2*0.18,0.4,0.13,0.15])

plot(1+(rand(1,45)-0.5)/2,currdata(:,1),'.','color',[1,1,1]*0.5)
hold on
plot(2+(rand(1,45)-0.5)/2,currdata(:,2),'.','color',[1,1,1]*0.5)
plot(3+(rand(1,45)-0.5)/2,currdata(:,3),'.','color',[1,1,1]*0.5)
bar(1:3,mean(currdata, 1),'facecolor','none','edgecolor',[0,0,0]);%usecolor(1,:))
errorbar(1:3,mean(currdata,1),std(currdata,[],1)/sqrt(length(currdata)),'k.')
box off
ylabel({'Index of ','edge suppression'})
ylim([0,1.2])

%%%% figure 6f

currdata = num(:,20:23);
currdata1 = currdata;
currdata1(currdata>2) = 2;
subplot('Position',[0.45+0*0.18,0.1,0.13,0.15])
for k = 1:2
    IE = currdata(:,[1:2]+(k-1)*2)';
    IE1 = currdata1(:,[1:2]+(k-1)*2)';
plot(1+(k-1)*3+(rand(1,45)-0.5)/2,IE1(1,:),'.','color',[1,1,1]*0.5);
hold on
plot(2+(k-1)*3+(rand(1,45)-0.5)/2,IE1(2,:),'.','color',[1,1,1]*0.5);

bar([1]+(k-1)*3,mean(IE(1,find(IE(2,:)>-0.1)),2),'edgecolor','none','facecolor',...
    [1,1,1]*(k-1)*0.7,'facealpha',0.5)
bar([2]+(k-1)*3,mean(IE(2,find(IE(2,:)>-0.1)),2),'edgecolor',[1,1,1]*(k-1)*0.7,...
    'facecolor','none')

errorbar([1,2]+(k-1)*3,mean(IE(:,find(IE(2,:)>-0.1)),2),...
    std(IE(:,find(IE(2,:)>-0.1)),[],2)/sqrt(45),'k.')
end
ylabel('I/E ratio')
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'black','white'})


%%%% figure 6g

label = {'black','white'};
subplot('Position',[0.45+1*0.18,0.1,0.13,0.15])
hold off
for k = 1:2
    currdata = num(:,[25:26]+(k-1)*2)';
currdata1 = currdata;
currdata1(currdata>1.5) = 1.5;

plot(1+(k-1)*3+(rand(1,45)-0.5)/2,currdata1(1,:),'.','color',[1,1,1]*0.5);
hold on
plot(2+(k-1)*3+(rand(1,45)-0.5)/2,currdata1(2,:),'.','color',[1,1,1]*0.5);

bar(1+(k-1)*3,mean(currdata(1,:)),'edgecolor','r','facecolor','none');
hold on
bar(2+(k-1)*3,mean(currdata(2,:)),'edgecolor','b','facecolor','none');
errorbar([1,2]+(k-1)*3,[mean(currdata(:,:),2)],...
    std([currdata(:,:)],[],2)/sqrt(45),'k.')
ylabel('spatial spread, sigma')
set(gca,'XTick',[1.5,4.5])
set(gca,'XTickLabel',{'black','white'})
end

%%%% figure 6h

Range  = [0,1,2,3,4,5,6,8;1,2,3,4,5,6,8,10];
subplot('Position',[0.45+2*0.18,0.1,0.13,0.15])
for k = 1:2
        currdata = num(:,[30:37]+(k-1)*8);

    mA = squeeze(mean(currdata));
    sA = squeeze(std(currdata))/sqrt(45);
    if k==1
    plot(mean(Range,1)/4,mA','k.-','linewidth',2)
    else
        plot(mean(Range,1)/4,mA','.-','color',[1,1,1]*0.7,'linewidth',2)
    end
    hold on
    errorbar(mean(Range,1)/4,mA,sA,'k.')
    set(gca,'XTick',mean(Range,1)/4)
    xlabel('spatial spread of inhibition,sigma')
    ylabel('goodness of fit')
    ylim([0.5,0.85])
end
box off
set(gca,'XTick',[0.2,0.6,1,1.4,1.8,2.2])
%% Supplementary figure 8
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig8');
currdata = num(:,1);
[h,b] = hist(currdata,[0:0.1:1])
figure
subplot(1,2,1)
[r,p] = corrcoef(num(:,1),num(:,2));
plot(num(:,2),num(:,1),'k.')
text(0.7,0.2,['p=',num2str(round(p(2)*100)/100)])
text(0.7,0.4,['r=',num2str(round(r(2)*100)/100)])
ylim([0,1])
xlabel('sustain index')
ylabel('goodness of fitting')
axis square
box off
[r,p] = corrcoef(num(:,1),num(:,3));
subplot(1,2,2)
plot(num(:,3),num(:,1),'k.')
text(0.3,0.2,['p=',num2str(round(p(2)*100)/100)])
text(0.3,0.4,['r=',num2str(round(r(2)*100)/100)])
ylim([0,1])
xlabel('filling-in index')
ylabel('goodness of fitting')
axis square
box off
%% Supplementary figure 9
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig9');

%%%%% 9a
currdata = num(:,[1,4]);
currid = find(~isnan(currdata(:,1)));
figure
subplot(2,2,3)
plot(currdata(:,1),currdata(:,2),'k.')
hold on
plot([0,150],[0,150],'k')
axis square
xlabel('surface latency')
ylabel('edge latency')
text(25,110,'L4C')
axis([0,150,0,150])
box off

currdata = num(:,[2,5]);
subplot(2,2,1)
p1 = plot(currdata(:,1),currdata(:,2),'k.')
hold on
plot([0,150],[0,150],'k')
axis square
currdata = num(:,[3,6]);
p2 = plot(currdata(:,1),currdata(:,2),'r.')
hold on
plot([0,150],[0,150],'k')
axis square
xlabel('surface latency')
ylabel('edge latency')
text(25,110,'L2/3')
legend([p1,p2],{'data','model'})
axis([0,150,0,150])
box off

%%%%% 9b
currdata = num(:,[8,11]);
currid = find(~isnan(currdata(:,1)));

subplot(2,2,4)
plot(currdata(:,1),currdata(:,2),'k.')
hold on
plot([0,1],[0,1],'k')
axis square
xlabel('surface sustain index')
ylabel('edge sustain index')
axis([0,1,0,1])
box off

currdata = num(:,[9,12]);
subplot(2,2,2)
plot(currdata(:,1),currdata(:,2),'k.')
hold on
currdata = num(:,[10,13]);
plot(currdata(:,1),currdata(:,2),'r.')
plot([0,1],[0,1],'k')
axis square
xlabel('surface sustain index')
ylabel('edge sustain index')
axis([0,1,0,1])
box off


%% Supplementary figure 12
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig12');
%%%% for 12a
currdata = num(:,1:2);
[r,p] = corrcoef(currdata(:,1),currdata(:,2));
figure
subplot(1,2,1)
plot(num(:,1),num(:,2),'o')
text(0.02,0.22,['p=',num2str(round(p(2)*100)/100)])
text(0.02,0.26,['N=',num2str(length(currdata))])
text(0.02,0.24,['r=',num2str(round(r(2)*100)/100)])
axis([0,0.3,0,0.3])
xlabel('surface activity (L4C)')
ylabel('inhibition on surface (L2/3)')
box off
axis square
title('between L2/3 and L4C')

%%%% for 12b
currdata = num(:,4:5);
[r,p] = corrcoef(currdata(:,1),currdata(:,2));
subplot(1,2,2)
plot(num(:,1),num(:,2),'o')
text(0.02,0.22,['p=',num2str(round(p(2)*100)/100)])
text(0.02,0.26,['N=',num2str(length(currdata))])
text(0.02,0.24,['r=',num2str(round(r(2)*100)/100)])
axis([0,0.3,0,0.3])
xlabel('surface activity (L2/3)')
ylabel('inhibition on surface (L2/3)')
box off
axis square
title('within L2/3')
