%After each run of the PRO model, concatenate variables for each condition,
%get model activity, and get behavior (probability of engaging)

close all
%effort levels in high-reward - non engage trials
% figure
% plot(mean(hh_omegaNne(:,2:200)), 'b')
% hold
% plot(mean(mhh_omegaNne(:,2:200)), 'c')
% plot(mean(mlh_omegaNne(:,2:200)), 'm')
% plot(mean(lh_omegaNne(:,2:200)), 'r')
% title('effort levels - high reward, non-engage')
% 
% figure
% %effort levels in low-reward, non-engage trials
% plot(mean(ll_omegaNne(:,2:200)), 'r')
% hold
% plot(mean(mll_omegaNne(:,2:200)), 'm')
% plot(mean(mhl_omegaNne(:,2:200)), 'c')
% plot(mean(hl_omegaNne(:,2:200)), 'b')
% title('effort levels - low-reward, non-engage')
% 
% figure
% %effort levels in high-reward -engage trials
% plot(mean(hh_omegaN(:,2:200)), 'b')
% hold
% plot(mean(mhh_omegaN(:,2:200)), 'c')
% plot(mean(mlh_omegaN(:,2:200)), 'm')
% plot(mean(lh_omegaN(:,2:200)), 'r')
% title('effort levels -  high-reward -engage trials')
% 
% figure

%effort levels in low-reward, engage trials
% plot(mean(ll_omegaN(:,2:200)), 'r')
% hold
% plot(mean(mll_omegaN(:,2:200)), 'm')
% plot(mean(mhl_omegaN(:,2:200)), 'c')
% plot(mean(hl_omegaN(:,2:200)), 'b')
% title('effort levels - low-reward, engage trials')
% 


ll_all=[ll_omegaN;ll_omegaNne];
mll_all=[mll_omegaN;mll_omegaNne];
mhl_all=[mhl_omegaN;mhl_omegaNne];
hl_all=[hl_omegaN;hl_omegaNne];

lh_all=[lh_omegaN;lh_omegaNne];
mlh_all=[mlh_omegaN;mlh_omegaNne];
mhh_all=[mhh_omegaN;mhh_omegaNne];
hh_all=[hh_omegaN;hh_omegaNne];

% figure
% plot(mean(ll_all(:,2:200)), 'r')
% hold
% plot(mean(mll_all(:,2:200)), 'm')
% plot(mean(mhl_all(:,2:200)), 'c')
% plot(mean(hl_all(:,2:200)), 'b')
% title('effort levels - low-reward, all trials')
% figure
% plot(mean(lh_all(:,2:200)), 'r')
% hold
% plot(mean(mlh_all(:,2:200)), 'm')
% plot(mean(mhh_all(:,2:200)), 'c')
% plot(mean(hh_all(:,2:200)), 'b')
% title('effort levels - high-reward, all trials')




lml_all=[lml_omegaN;lml_omegaNne];
mlml_all=[mlml_omegaN;mlml_omegaNne];
mhml_all=[mhml_omegaN;mhml_omegaNne];
hml_all=[hml_omegaN;hml_omegaNne];



lmh_all=[lmh_omegaN;lmh_omegaNne];
mlmh_all=[mlmh_omegaN;mlmh_omegaNne];
mhmh_all=[mhmh_omegaN;mhmh_omegaNne];
hmh_all=[hmh_omegaN;hmh_omegaNne];

low_reward=[sum(mean(hl_all(:,2:200))) sum(mean(mhl_all(:,2:200))) sum(mean(mll_all(:,2:200))) sum(mean(ll_all(:,2:200)))];
low_reward=fliplr(low_reward);

mid_reward=[sum(mean(hmh_all(:,2:200))) sum(mean(mhmh_all(:,2:200))) sum(mean(mlmh_all(:,2:200))) sum(mean(lmh_all(:,2:200)))];
mid_reward=fliplr(mid_reward);

high_reward=[sum(mean(hh_all(:,2:200))) sum(mean(mhh_all(:,2:200))) sum(mean(mlh_all(:,2:200))) sum(mean(lh_all(:,2:200)))];
high_reward=fliplr(high_reward);

pctengage_low=[size(ll_omegaN,1)./(size(ll_omegaN,1)+size(ll_omegaNne,1)) ...
            size(mll_omegaN,1)./(size(mll_omegaN,1)+size(mll_omegaNne,1)) ...
            size(mhl_omegaN,1)./(size(mhl_omegaN,1)+size(mhl_omegaNne,1)) ...
            size(hl_omegaN,1)./(size(hl_omegaN,1)+size(hl_omegaNne,1))];
        
pctengage_high=[size(lh_omegaN,1)./(size(lh_omegaN,1)+size(lh_omegaNne,1)) ...
            size(mlh_omegaN,1)./(size(mlh_omegaN,1)+size(mlh_omegaNne,1)) ...
            size(mhh_omegaN,1)./(size(mhh_omegaN,1)+size(mhh_omegaNne,1)) ...
            size(hh_omegaN,1)./(size(hh_omegaN,1)+size(hh_omegaNne,1))];