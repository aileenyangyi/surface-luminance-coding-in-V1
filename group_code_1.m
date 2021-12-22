%% figure 1e (and supplementary figure 2c )
%%%% load relevant data

%%% for figure 1e use
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig 1');
raw_data = num(:,3:4);
T_depth = raw_data(:,2);
T_ratio = raw_data(:,1);
%%% for supplementary figure 2c use
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig2');
raw_data = num(:,3:4);
T_depth = raw_data(:,2);
T_ratio = raw_data(:,1);
%%%%

figure
hold on
yy = 0:2:100;
M_ratio = [];Std_ratio = [];
for ii = 1:length(yy)
    id = find(T_depth>yy(ii)-4&T_depth<yy(ii)+4 ...
        &T_ratio<1.5&T_ratio>-0.5);
    M_ratio(ii) = mean(T_ratio(id));
    Std_ratio(ii) = std(T_ratio(id))/sqrt(length(id));
end
fill([M_ratio+Std_ratio,flipdim(M_ratio-Std_ratio,2)],[yy,flipdim(yy,2)],...
    [1,1,1]*0.5,'edgecolor','none');
hold on;
plot(M_ratio,yy,'k','linewidth',2)
bounder = [0,18,36,43,57,68,81,100];

for l = 1:7
    hold on
    plot([-1,2],[bounder(l),bounder(l)],'k--','linewidth',2)
    
end
ylim([0,100])
xlim([0,1])
xlabel({'S/E','30-200ms'})
ylabel('relative depth')
axis ij

%% Supplement figure1
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Supplementary Fig1');
currdata = num(:,1);
[h,b] = hist(currdata,[0:0.1:1.5]);
figure;subplot(2,1,1)
hold on
bar(b,h,'facecolor',[0.5,0.5,0.5],'edgecolor','none')
xlabel('CRF size^o (diameter)')
ylabel('number of sites')
xlim([0,8])
currdata = num(:,3);
currid = find(~isnan(currdata));
currdata = currdata(currid);
[h,b] = hist(currdata,[0:0.5:8]);

subplot(2,1,2)
bar(b,h,'facecolor',[0.5,0.5,0.5],'edgecolor','none')
xlabel('eCRF size^o (diameter)')
ylabel('number of sites')
xlim([0,8])
H = axes('position',[0.6 0.3 0.2 0.1])

plot(b,cumsum(h)/sum(h),'k','linewidth',1)
