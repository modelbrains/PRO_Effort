%store_data - stores data from trial that we just finished.
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

this=find(ros>0);  %find which ro conjunction we just had
rts=ones(respN.*outN,1).*rt; %index reaction times
tN=ones(respN.*outN,1).*i;
omegaN_cat=[rts omegaN_cat tN];
omegaP_cat=[rts omegaP_cat tN];

tag=[labels{effort} labels{rlev}];

if output==1 %model engaged
eval([tag '_omegaN=[' tag '_omegaN; omegaN_cat];']);
eval([tag '_omegaP=[' tag '_omegaP; omegaP_cat];']);
else %model did not engage

eval([tag '_omegaNne=[' tag '_omegaNne; omegaN_cat];']);
eval([tag '_omegaPne=[' tag '_omegaPne; omegaP_cat];']);
end
    
            
            