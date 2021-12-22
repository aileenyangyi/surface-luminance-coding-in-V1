%% figure 5
%%%% load relevant data
[num,Name] = xlsread('NCOMMS-21-11016A-source-data','Fig5');

%%%% figure 5d
raw_data = num(:,1:7);
for l = 1:7
    currinh = raw_data(:,l);
    currid = find(~isnan(currinh));%%% remove NAN in dataset 
    mean_inh(l,1) = mean(currinh(currid));
    sem_inh(l,1) = std(currinh(currid))/sqrt(length(currid));
end
figure
subplot(1,3,1)
plot(1:7,mean_inh,'k-','linewidth',2)
errorbar(1:7,mean_inh,sem_inh,'k.-','linewidth',2)
view(-90,90)
xlim([0.5,7.5])
ylim([0.25,1])
ylabel({'Index of','surface suppression'})
set(gca,'XTick',1:7)
set(gca,'XTickLabel',Layer)
set(gca,'xdir','reverse','ydir','reverse')
box off

%%% figure 5f
raw_data = num(:,9:15);
for l = 1:7
    currinh = raw_data(:,l);
    currid = find(~isnan(currinh));%%% remove NAN in dataset 
    mean_inh(l,1) = mean(currinh(currid));
    sem_inh(l,1) = std(currinh(currid))/sqrt(length(currid));
end
subplot(1,3,2)
plot(1:7,mean_inh,'k-','linewidth',2)
errorbar(1:7,mean_inh,sem_inh,'k.-','linewidth',2)
view(-90,90)
xlim([0.5,7.5])
ylim([-0.2,0.6])
ylabel({'Index of','edge suppression'})
set(gca,'XTick',1:7)
set(gca,'XTickLabel',Layer)
set(gca,'xdir','reverse','ydir','reverse')
box off

%%% figure 5g
raw_data = num(:,17:18);
[r,p] = corrcoef(raw_data(:,1),raw_data(:,2));
subplot(1,3,3)
plot(raw_data(:,1),raw_data(:,2),'k.','markersize',10)
if p(2)>0.01
text(0.5,-0.2,['p=',num2str(round(p(2)*1000)/1000)])
else
    text(0.5,-0.2,['p<0.01'])
end
text(0.5,0,['r=',num2str(round(r(2)*1000)/1000)])
text(0.5,0.2,['N=',num2str(length(raw_data))])
a = polyfit(raw_data(:,1),raw_data(:,2),1);
hold on
plot([-1,2],[-1,2]*a(1)+a(2),'k-')

xlabel({'sustain index of surface','response at L4Cb'})
ylabel({'sustain index of surface','response at L3'})
box off
axis([-0.5,1.2,-0.5,1.2])