%% figure 2
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig 2');

%%% figure 2a
raw_data = num(2:end,1:14);
for l = 1:7
    currratio = raw_data(:,l);
    currid = find(~isnan(currratio));%%% remove NAN in dataset 
    mean_ratio(l,1) = mean(currratio(currid));
    sem_ratio(l,1) = std(currratio(currid))/sqrt(length(currid));
    currratio = raw_data(:,l+7);
    mean_ratio(l,2) = mean(currratio(currid));
    sem_ratio(l,2) = std(currratio(currid))/sqrt(length(currid));
end

Layer{1} = 'L2';Layer{2} = 'L3';Layer{3} = 'L4B';
Layer{4} = 'L4Ca';Layer{5} = 'L4Cb';Layer{6}=  'L5';Layer{7} = 'L6';
figure
subplot(3,3,1)
p1 = plot(1:7,mean_ratio(:,1),'k','linewidth',2)
hold on
errorbar(1:7,mean_ratio(:,1),sem_ratio(:,1),'k.-','linewidth',2)
p2 = plot(1:7,mean_ratio(:,2),'-','color',[0.7,0.7,0.7],'linewidth',2)
errorbar(1:7,mean_ratio(:,2),sem_ratio(:,2),'.-','color',[0.7,0.7,0.7],'linewidth',2)
view(-90,90)
xlim([0.5,7.5])
ylim([0,0.8])
ylabel('S/E')
set(gca,'XTick',1:7)
set(gca,'XTickLabel',Layer)
set(gca,'xdir','reverse','ydir','reverse')
hleg = legend([p1,p2],{'40-100ms','120-180ms'},'fontsize',10 ,'Location','NorthEast')
legend('boxoff')

%%% figure 2c and 2d
raw_data = num(:,[16:17,19:20]);
L = [2,5];

for jj = 1:2
subplot('position',[0.1+(jj-1)*0.3 0.43 0.2 0.2])

hold off
currratio = raw_data(:,[1:2]+(jj-1)*2);
currid  = find(~isnan(currratio(:,1)));%%% remove NAN in dataset 
currratio = currratio(currid,:);

currratio1 = currratio;
currratio1(currratio<0) = 0;%%% make data points which <0 shown on the figure
plot(currratio1(:,1),currratio1(:,2),'k.','markersize',10)
%%% mark samples in figure 2b
hold on
if jj==1
    plot(currratio(21,1),currratio(21,2),'r.','markersize',10)
    plot(currratio(32,1),currratio(32,2),'r.','markersize',10)
elseif jj==2
    plot(currratio(20,1),currratio(20,2),'r.','markersize',10)
    plot(currratio(35,1),currratio(35,2),'r.','markersize',10)
end
%%%
plot([-2,2],[-2,2],'k-')
axis([-0,2,-0,2])
ylabel({'S/E ratio','during 120-180ms'})
xlabel({'S/E ratio','during 40-100ms'})
text(0.1,1.8,Layer{L(jj)})

H = axes('position',[0.19+(jj-1)*0.3 0.52 0.2 0.2])

[b,h] = hist(diff((currratio),[],2),[-1:0.2:1]);
bar(flipdim(h,2),(b)/sum(b),'facecolor','k','Edgecolor','none')
alpha(0.5)
xlim([-1,1])
ylim([0,1])
view([45,90])
axis off
end

%%% figure 2e-f
raw_data = num(:,[22:23]);
currid = find(~isnan(raw_data(:,1)));
[r,p] = corrcoef(raw_data(currid,1),raw_data(currid,2));

% figure
subplot(3,3,6)
plot(raw_data(currid,1),raw_data(currid,2),'k.','markersize',10)
if p(2)>0.01
text(0.4,-0.4,['p=',num2str(round(p(2)*1000)/1000)])
else
    text(0.3,-0.6,['p<0.01'])
end
text(0.3,-0.4,['r=',num2str(round(r(2)*1000)/1000)])
text(-0.5,0.5,['n=',num2str(length(currid)),' pairs'])
hold on;plot([-1,1],[-1,1],'-','color',[1,1,1]*0.5)
xlabel('Index of filling-in at L4Cb ')
ylabel('Index of filling-in at L3 ')
box off
axis([-0.7,0.7,-0.7,0.7])

raw_data = num(1:7,[26:32]);
raw_data(isnan(raw_data)) = 1;
subplot(3,3,7)
imagesc(raw_data,[0,1])
colormap jet
h = colormap;
h(end,:) = [1,1,1];
colormap(h)
hbar = colorbar('EastOutside');
set(hbar,'position',[0.9 0.2 0.02 0.08])
set(gca,'XTick',[1:7])
set(gca,'XTickLabel',{'2','3','4B','4Ca','4Cb','5','6'})
set(gca,'YTick',[1:7])
set(gca,'YTickLabel',{'2','3','4B','4Ca','4Cb','5','6'})
xtb = get(gca,'XTickLabel');
text(1:7+0.6,ones(1,7)*7.7,xtb,'HorizontalAlignment','right','rotation',50);
set(gca,'XTick',-999)
box off
title({'correlation of filling-in index'})

%%% figure 2g-h
raw_data = num(:,[34:35]);
currid = find(~isnan(raw_data(:,1)));
[r,p] = corrcoef(raw_data(currid,1),raw_data(currid,2));


subplot(3,3,8)
plot(raw_data(currid,1),raw_data(currid,2),'k.','markersize',10)

if p(2)>0.01
text(0.7,0.13,['p=',num2str(round(p(2)*1000)/1000)])
else
    text(0.7,0.13,['p<0.01'])
end
text(0.7,0.3,['r=',num2str(round(r(2)*1000)/1000)])
text(0,0.9,['n=',num2str(length(currid)),' pairs'])
hold on;plot([-1,1],[-1,1],'-','color',[1,1,1]*0.5)
xlabel({'sustain index of surface','response at L4Cb'})
ylabel({'sustain index of surface','response at L3'})
box off
axis([-0.2,1,-0.2,1])

raw_data = num(1:7,[38:44]);
raw_data(isnan(raw_data)) = 1;
subplot(3,3,9)
imagesc(raw_data,[0,1])
colormap jet
h = colormap;
h(end,:) = [1,1,1];
colormap(h)
hbar = colorbar('EastOutside');
set(hbar,'position',[0.9 0.2 0.02 0.08])
set(gca,'XTick',[1:7])
set(gca,'XTickLabel',{'2','3','4B','4Ca','4Cb','5','6'})
set(gca,'YTick',[1:7])
set(gca,'YTickLabel',{'2','3','4B','4Ca','4Cb','5','6'})
xtb = get(gca,'XTickLabel');
text(1:7+0.6,ones(1,7)*7.7,xtb,'HorizontalAlignment','right','rotation',50);
set(gca,'XTick',-999)
box off
title({'correlation of sustain index'})
%% Supplementary figure 3
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig 3');
%%% for white contiditon
raw_data = num(:,1:7);
%%% for black contiditon
raw_data = num(:,18:24);


figure
for l = 1:7
    currrindex = raw_data(:,l);
    currid = find(~isnan(currrindex));%%% remove NAN in dataset 
    currrindex = currrindex(currid); 
    currrindex1 = currrindex;
    currrindex1(currrindex>0.5) = 0.5;
    currrindex1(currrindex<-0.5) = -0.5;
    
    mean_index(l,1) = mean(currrindex);
    sem_index(l,1) = std(currrindex)/sqrt(length(currid));
    hold on
    plot(l+(rand(1,length(currid))-0.5)/2,currrindex1,'.','color',[1,1,1]*0.5)
end

bar(1:7,mean_index,'edgecolor','k','facecolor',[0.7,0.7,0.7],'facealpha',0.5)
set(gca,'XTick',[1:7])
set(gca,'XTickLabel',Layer)
ylabel('filling-in index')

%% Supplementary figure 4
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig 4');
fill_data = num(:,1:7);
Sus_edge_data = num(:,9:15);
Sus_surface_data = num(:,17:23);

L = [2,5];
figure
for ii = 1:2
currdata_sus = Sus_edge_data(:,L(ii));
currdata_fill = fill_data(:,L(ii));
currid = find(~isnan(currdata_sus));
currdata_sus = currdata_sus(currid);
currdata_fill = currdata_fill(currid);
[r,p] = corrcoef(currdata_sus,currdata_fill);
subplot(5,5,[6:5:21]+(ii-1)*2)
plot(currdata_sus,currdata_fill,'b.')
if p(2)>0.01
text(0.1,0.7,['p=',num2str(round(p(2)*100)/100)])
else
    text(0.1,0.7,['p<0.01'])
end
text(0.1,0.9,['r=',num2str(round(r(2)*100)/100)])
text(0.1,0.5,['n=',num2str(length(currid))])

xlim([0.1,0.8])
ylim([-0.8,1.2])
xlabel('sustain index of edge')
ylabel('index of filling')
axis square
[h,b] = hist(currdata_sus,[0:0.06:0.8]);
subplot(5,5,1+(ii-1)*2)
bar(b,h/sum(h)*100,'k')
ylim([0,60])
ylabel('site number (%)')
xlim([0.1,0.8])

currdata_sus = Sus_surface_data(:,L(ii));
currdata_fill = fill_data(:,L(ii));
currid = find(~isnan(currdata_sus));
currdata_sus = currdata_sus(currid);
currdata_fill = currdata_fill(currid);
[r,p] = corrcoef(currdata_sus,currdata_fill);
subplot(5,5,[6:5:21]+1+(ii-1)*2)
plot(currdata_sus,currdata_fill,'r.')
if p(2)>0.01
text(0.1,0.7,['p=',num2str(round(p(2)*100)/100)])
else
    text(0.1,0.7,['p<0.01'])
end
text(0.1,0.9,['r=',num2str(round(r(2)*100)/100)])
text(0.1,0.5,['n=',num2str(length(currid))])

xlim([0.1,0.8])
ylim([-0.8,1.2])
xlabel('sustain index of surface')
ylabel('index of filling')
axis square
[h,b] = hist(currdata_sus,[0:0.06:0.8]);
subplot(5,5,2+(ii-1)*2)
bar(b,h/sum(h)*100,'k')
ylim([0,60])
xlim([0.1,0.8])
end
%
%%%% 4c
R = [];P = [];
for l = 1:7
currdata_sus = Sus_edge_data(:,l);
currdata_fill = fill_data(:,l);
currid = find(~isnan(currdata_sus));
currdata_sus = currdata_sus(currid);
currdata_fill = currdata_fill(currid);
[r,p] = corrcoef(currdata_sus,currdata_fill);
 R(l,1)= r(2);
 P(l,1)= p(2);
 
 currdata_sus = Sus_surface_data(:,l);
currdata_fill = fill_data(:,l);
currid = find(~isnan(currdata_sus));
currdata_sus = currdata_sus(currid);
currdata_fill = currdata_fill(currid);
[r,p] = corrcoef(currdata_sus,currdata_fill);
 R(l,2)= r(2);
 P(l,2)= p(2);
 
end
 subplot(1,5,5)
 plot(R(:,1),1:7,'b')
 hold on
 plot(R(:,2),1:7,'r')
 plot(R(:,1)*0,1:7,'k--')
axis ij
ylim([0.5,7.5])
xlim([-0.5,1])
xlabel('correlation coefficient')
set(gca,'YTick',1:7)
set(gca,'YTickLabel',Layer)
box off