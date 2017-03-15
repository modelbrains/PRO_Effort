%get current trial for change signal task
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

this_inp=zeros(1,stimN);
%Is this trial:
    %Effort 
    effort=randperm(4);effort=effort(1);
    rlev=randperm(4);rlev=rlev(1);


    
%set up flags and dynamics for trial
trialcat=eval([num2str(effort) num2str(rlev)]); 
    
switch effort
    case 1
        go=0.*length_chain+1;
    case 2
        go=1.*length_chain+1;
    case 3
        go=2.*length_chain+1;
    case 4
        go=3.*length_chain+1;
end

switch rlev
    case 1
        change=4.*length_chain+1;
    case 2
        change=5.*length_chain+1;
    case 3
        change=6.*length_chain+1;
    case 4
        change=7.*length_chain+1;
end
changetime=1;

  
%init variables at the beginning of each trial;
    
    %vars related to temporal difference model
pred=zeros(1,respN.*outN); %initial TD prediction at the beginning of a trial
last_pred=zeros(1,respN.*outN); %last TD prediction;
last_delay_chain=zeros(size(delay_chain)); %delay chain for recently visited states
elig=zeros(size(delay_chain)); %eligibility trace initially set to zero;
last_elig=elig;    

set_out_flag=0;  %has a response been generated?
ros=0.*ros;      %observed r-o conjunction
end_flag=0;      %flag for ending stimulus presentation
learn_flag=0;    %flag for learning on the first step a r-o conjunction is observed
count=100;       %outcomes are only presented to the model if count is < 20
                 %when a new outcome is observed (interpret_response.m),
                 %count is set to 0.  This variable increments +1 on each
                 %model iteration.

valence=0;        %init valence (no outcomes observed yet, so no valence);
act_out=zeros(1,respN); %response unit activity

omegaN_cat=[];  %init variables for storing data on each iteration
omegaP_cat=[];

