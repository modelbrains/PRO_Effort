%Specification of model parameters and such - adapted for effort
%simulations March 2017
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


%%simulation parameters
dt=0.01;            %length of each iteration of the model in seconds
trial_length=3;     %length of each trial in seconds;

%experiment parameters
trialN=1000;         %number of trials in an experiment
stimN=8;            %total number of potential stimuli - 4 levels of effort and reward each
respN=2;            %total number of potential responses (e.g., accept/reject)
outN=2;             %total number of potential feedback signals (e.g., reward/effort)

%Note regarding experiment parameters: the scripts included in this package
%were originally tailored to the Change Signal Task with Low and High Error Likelihood
%conditions. You can change the number of stimuli, response, or feedback
%signals in an experiment by modifying the numbers above, and the scripts
%should automatically incorporate that information when building the model
%for simulation (i.e., weight matrices and various other indices will be of
%appropriate size).  HOWEVER, in order for additional stimuli, responses,
%or feedback to have a meaningful experimental interpretations, other
%scripts must also be modified to reflect the experiment you wish to
%simulate, including get_current_trial.m, interpret_response.m &
%set_current_inp.m.  These scripts constitute the task environment in which
%the PRO model lives, and are not part of the PRO model itself.


%model parameters
    %TD model
alphaTD=0.1;        %learning rate for Temporal Difference Model
gammaTD=0.95;       %discount rate for TD model
elig=0.95;          %eligibility trace decay
length_chain=200;   %total number of time steps a temporal representation 
                    %of a stimulus is active.
delay_chain=zeros(1, length_chain.*stimN); %delay chain used for TD model                    

   
threshold = x(1);  %threshold for response units.
alpharos=x(2);     %learning rate for updating Response-Outcome probabilities
rho=x(3);          %multiplier for dynamic response units
phi=x(4);          %multiplier for dynamic response inhibition
psi=x(5);
noise=x(6);        %variance of response unit noise
rate=x(7);
lscale=1;


%curr_param_set(4)=changes in reward
%curr_param_set(5)=changes in effort
%curr_param_set(6)=global reward multiplier
%curr_param_set(7)=global effort multiplier

%reward levels
r_feedback=[1 2 3 4].*.48;
%effort levels
e_feedback=[.5 1 1.5 2].*1.1;
r_feedback=r_feedback.*curr_param_set(6);
e_feedback=e_feedback.*curr_param_set(7);
default_value=.25.*curr_param_set(6);

%used in interpret_response.m to set the level of feedback during decoupled
%simulations
reward_mult=curr_param_set(4);
effort_mult=curr_param_set(5);

%set up weight matrices and various indices
stim2resp=zeros(stimN,respN);  %hardwired weights from task stimuli to response units
    %slight bias for engaging  
    stim2resp=ones(size(stim2resp)).*.2;
    stim2resp(:,2)=.15;
   
mut_inhib=eye(respN);%mutual inhibition of response weights
    mut_inhib=(mut_inhib-1).*-1;
    
stim2conj=zeros(stimN, respN.*outN);  %stimulus to response-outcome predictions

stim2temporal=zeros(respN.*outN, length_chain.*stimN); %stimulus to temporal prediction weights

conj2resp=zeros(respN.*outN, respN); %top-down control weights

resp=zeros(1,respN);    %activity of response units
ros=zeros(1,respN.*outN);  %index of response-outcome conjunctions
    
   