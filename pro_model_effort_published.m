%Predictions of responses and outcomes model
%     Copyright 2011 Will Alexander
%   
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.        




%Select task to simulate
% clear
% close all
task='effort';
%load parameters from behavioral fit
load('behavioral_fit_params.mat')
x(1)=.25;
curr_dir=pwd;
eval(['cd ' task]);


model_spec;  %call script with model and experiment specifications
data_structs; %call script to set up data structures for Change Signal Task
tic
%%%%%Start Trial Loop%%%%%%
for i=1:trialN
    if (mod(i, 50)==0)
        disp(['Trial Number:   ' num2str(i) '/' num2str(trialN)]);
    end
    get_current_trial; %set up conditions for current trial
rt=0;   
deadline=100;
     %%%%loop over current trial%%%%%%%
    for j=0:trial_length./dt



        set_current_inp;

        elig=.95.*elig+delay_chain;%Eq. 10
        pred=delay_chain*stim2temporal'; %Get the vector temporal prediction 
                                         %for this time step %Eq. 8

        %Get prediction of RO conjunctions
        ro_pred=this_inp*stim2conj;  %%Eq. 3
        
        %Get top-down control signal
        cont_sig=conj2resp'*(ro_pred');%Eq. 13
                  if j>deadline && set_out_flag==0
              tmpresp=find(resp==max(resp));
              resp(tmpresp)=10;
          end
        %%Check for response occurrence
        if max(resp)>threshold && set_out_flag==0
            
            interpret_response;
            
            
        end
        
             %outcomes are interpreted as lasting 20 model iterations
             %(200ms)
             if count<20 %on the first iteration in which an outcome is observed
                         %interpret_response.m sets count to 0.
               TDoutcome=ros./20;
               on=1;
             else
               TDoutcome=ros.*0;
               on=0;
             end
        
             %get TD prediction error
             delta=TDoutcome+gammaTD.*pred-last_pred; %EQ. 7
          
 
             %update temporal prediction weights
             stim2temporal=stim2temporal+alphaTD.*(delta'*last_elig); %Eq 9
           %  stim2temporal=stim2temporal+.01.*(delta'*last_elig); %Eq 9
    
             %rectify - no prediction weights under 0;
             stim2temporal(stim2temporal<0)=0;
             
             %divide signal into positive and negative components
             omegaN=pred-ros.*on; %Eq. 15
             omegaP=TDoutcome.*on-pred;%Eq. 16
             
             %rectify signal components
             omegaN(omegaN<0)=0;
             omegaP(omegaP<0)=0;
             

             %%Update adjustable weights in the model
             if learn_flag

                 %update predictions of RO - %Eq. 4
                 disc=ros-ro_pred;  

                 delta_pred=(this_inp'*disc);%.*(this_inp'*(1./(1+lscale.*abs(delta))));
                 stim2conj=stim2conj+alpharos.*delta_pred;
                stim2conj(stim2conj<0)=0;
                 %update top-down control weights
                 delta_cont=act_out'*(ros);
                 conj2resp=conj2resp+.01.*delta_cont'.*valence;%Eq 14

                %shut off learning
                learn_flag=0;
             end
             
             
  %prepare for the next trial iteration
    cont_sig_pos = max(cont_sig, 0);
    cont_sig_neg = -min(cont_sig, 0);
    %calculate excitatory and inhibitory input to control units
        Ae=rho.*(this_inp*stim2resp+cont_sig_neg'); %net excitation to response units; Eq. 12
        Ai=phi.*(cont_sig_pos')+psi.*(resp*mut_inhib);%net inhibition to response units; Eq. 13
        
    %update response unit activities
        resp=resp+rate.*dt.*((1-resp).*Ae - (resp+.05).*(Ai+1)) + randn(1,respN).*noise;%Eq. 11
        resp(resp<0)=0;
        
        omegaN_cat(:,j+1)=omegaN';
        omegaP_cat(:,j+1)=omegaP';
        
    %bookkeeping for TD model
        last_pred=pred;
        last_delay_chain=delay_chain;
        last_elig=elig;
        count=count+1; %increment count variable.
    end %trial
%     resp
resp=resp.*.01; 
if i>500
        store_data; %store data for trial that was just completed
end
        %begin next iteration of the trial     
end

%sort variables 
misc_plots
             eval(['cd ' curr_dir ]);%back to original directory
             
             
             toc