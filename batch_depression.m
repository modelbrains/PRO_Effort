%hypotheses
%H1 - global reduced reward
%H2 - global increased effort
%H3 - decoupled - decreased reward in ACC
%H4 - decoupled - increased effort in ACC

%subhypotheses
%h5 - global increased reward
%h6 - global decreased effort
%h7 - decoupled - increased reward in ACC
%h8 - decoupled - decreased effort in ACC

%current parameters that seem to correspond fairly okay to the effort data in eliana's
%paper

%reward levels
r_feedback=[1 2 3 4].*.48;
%effort levels
e_feedback=[.5 1 1.5 2].*1.1;

%so: basically 8 simulations, 100 subjects each, record mean activity for 
%all trials, as well as trial number of trials for engage/not engage per
%condition.

%reward scale, effort scale, default_reward, ACC_reward_mult,
%ACC_effort_mult, global_reward_mult global_effort_mult
dep_params=[.48 1.1 .25 1 1 1 1; %control subjects
            .48 1.1 .25 1 1 .5 1; %global reduced reward
            .48 1.1 .25 1 1 1 2; %global increased effort
            .48 1.1 .25 .5 1 1 1; %decoupled - decreased ACC reward
            .48 1.1 .25 1 2 1 1; %decoupled - increased ACC effort
            .48 1.1 .25 1 1 2 1; %global increased reward
            .48 1.1 .25 1 1 1 .5; %global decreased effort
            .48 1.1 .25 2 1 1 1; %decoupled, increased ACC reward
            .48 1.1 .25 1 .5 1 1]; %decoupled, decreased ACC effort
        
set_labels={'control', 'glob_red_rew', 'glob_inc_eff', 'dec_red_rew', 'dec_inc_eff',...
            'glob_inc_rew', 'glob_dec_eff', 'dec_inc_rew', 'dec_red_eff'};
        
poolN=size(dep_params,1);
subN=100;
for currPool=bbDp;%2;%1:poolN
    
    curr_param_set=dep_params(currPool,:);
    pct_engage_low_reward=[];%split by effort level
    pct_engage_high_reward=[];
    acc_act_low_reward=[];%split by effort level
    acc_act_high_reward=[];%split by effort level
    for sN=1:subN
    clear pctengage_low pctengage_high low_reward high_reward
    
        pro_model_effort
        
        pct_engage_low_reward=[pct_engage_low_reward;pctengage_low];
        pct_engage_high_reward=[pct_engage_high_reward;pctengage_high];
        acc_act_low_reward=[acc_act_low_reward; low_reward];
        acc_act_high_reward=[acc_act_high_reward; high_reward];
    end
    
    eval(['save ' set_labels{currPool} '_new.mat pct_engage_low_reward pct_engage_high_reward acc_act_high_reward acc_act_low_reward'])
    
end
      
        
        
        
        
        
    
    
    
    
    
    
    
        