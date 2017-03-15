%depression figures
close all
lead_tags={'glob_', 'dec_', 'cont_'};
mid_tags={'inc_', 'red_'};
end_tags={'eff', 'rew'};

titlebeg={'global', 'decoupled', 'cont'};
titlemid={'increased', 'reduced'};
titleend={'effort', 'reward'};
y=load('Control.mat');
for i=1:length(lead_tags)
    for j=1:length(mid_tags)
        for k=1:length(end_tags)
            
           thisfile=[lead_tags{i} mid_tags{j} end_tags{k}];
           try
           x=load(thisfile);
           
           figure
           subplot(2,1,1);
           errorbar(mean(x.acc_act_high_reward), std(x.acc_act_high_reward),'b')
           hold on
           errorbar(mean(x.acc_act_low_reward), std(x.acc_act_low_reward),'r')
           errorbar(mean(y.acc_act_high_reward), std(y.acc_act_high_reward),'b--')
           errorbar(mean(y.acc_act_low_reward), std(y.acc_act_low_reward),'r--')
           hold off
            legend({'high reward', 'low reward','high reward - control', 'low reward - control'}, 'Location', 'NorthWestOutside')
           ylabel('ACC Activity')
           title([titlebeg{i} ' ' titlemid{j} ' ' titleend{k}])
           subplot(2,1,2)
           errorbar(mean(x.pct_engage_high_reward), std(x.pct_engage_high_reward),'b')
           hold on
           errorbar(mean(x.pct_engage_low_reward), std(x.pct_engage_low_reward),'r')
           errorbar(mean(y.pct_engage_high_reward), std(y.pct_engage_high_reward),'b--')
           errorbar(mean(y.pct_engage_low_reward), std(y.pct_engage_low_reward),'r--')
         
           hold off
             legend({'high reward', 'low reward','high reward - control', 'low reward - control'}, 'Location', 'NorthWestOutside')
           ylabel('% trials accept')
           set(gca, 'YLim', [0 1.1]);
           set(gcf, 'Color', 'White')
           
           eval(['print -dtiff -r300 ' titlebeg{i} '_' titlemid{j} '_' titleend{k} '.tif'])
           catch
               disp([titlebeg{i} ' ' titlemid{j} ' ' titleend{k} ' doesn''t exist'])
           end
        end
    end
end

%make control figure
x=load('control.mat');
           
           figure
           subplot(2,1,1);
           errorbar(mean(x.acc_act_high_reward), std(x.acc_act_high_reward),'b')
           hold on
           errorbar(mean(x.acc_act_low_reward), std(x.acc_act_low_reward),'r')
           hold off
            legend({'high reward', 'low reward'}, 'Location', 'NorthWestOutside')
           ylabel('ACC Activity')
           title(['Control'])
           subplot(2,1,2)
           errorbar(mean(x.pct_engage_high_reward), std(x.pct_engage_high_reward),'b')
           hold on
           errorbar(mean(x.pct_engage_low_reward), std(x.pct_engage_low_reward),'r')
           hold off
            legend({'high reward', 'low reward'}, 'Location', 'NorthWestOutside')
           ylabel('% trials accept')
           set(gca, 'YLim', [0 1]);
           set(gcf, 'Color', 'White')
           xlabel('effort condition')
           
           eval(['print -dtiff -r300 control.tif'])