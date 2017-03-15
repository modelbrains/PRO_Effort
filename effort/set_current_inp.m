%set_current_inp - handles presentation of change signal, update of TD
%delay chains, and update of eligibility traces
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


if j<length_chain %if j is greater than the length of the delay chain, trials over
            this_go_delay=j+go; %indexes current go delay
            this_inp(effort)=1;
            if (j-changetime)>=0 %Is the change signal on yet?
                this_change_delay=j-changetime+change; %if so, index it;
                this_inp(rlev+4)=1;  %add change signal to input
            else
                this_change_delay=this_go_delay;%Basically tells model to index time-delay at the same unit as the go signal.
                
               
            end
            delay_chain=delay_chain.*0; %reset delay_chain in order to cleanly insert new indices
            delay_chain(this_go_delay)=1;delay_chain(this_change_delay)=1; %which we just did.
            
        else
        delay_chain=delay_chain.*0;%shut off delay chain if it's past the limit
        this_inp=0.*this_inp; %stimuli are shut off
        
end
        