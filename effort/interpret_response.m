%interpret_response - when a response is generated, update predictions of r-o
%conjunctions and top-down control weights
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


            set_out_flag=1; %We have a response!
            learn_flag=1; %and we should start learning something
            output=find(resp==max(resp)); %What response did we make?
            act_out(output)=1; %register which output actually occurred.
            rt=j; %keeps track of reaction time
            
            %output 1 = engage
            %output 2 = default
            
            if output==2 %model didn't engage, gets small reward and that's it
                ros(3)=.1;
                valence=-default_value;

                err=0;
            end
            if output==1 %model engaged, now we have to figure out what that means.
                ros(1)=r_feedback(rlev).*reward_mult;
                ros(2)=e_feedback(effort).*effort_mult;
                valence=e_feedback(effort)-r_feedback(rlev);

                err=0;
            end

            
            count = 0; %set count to 0 to indicate beginning of outcome presentation to model.