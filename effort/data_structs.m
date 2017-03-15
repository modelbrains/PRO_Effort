%data_structs - set up empty matrices to collect data for change signal
%task
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
labels={'l', 'ml','mh', 'h'};
 
ll_omegaN=[];
lml_omegaN=[];
lmh_omegaN=[];
lh_omegaN=[];

mll_omegaN=[];
mlml_omegaN=[];
mlmh_omegaN=[];
mlh_omegaN=[];

mhl_omegaN=[];
mhml_omegaN=[];
mhmh_omegaN=[];
mhh_omegaN=[];

hl_omegaN=[];
hml_omegaN=[];
hmh_omegaN=[];
hh_omegaN=[];

ll_omegaP=[];
lml_omegaP=[];
lmh_omegaP=[];
lh_omegaP=[];

mll_omegaP=[];
mlml_omegaP=[];
mlmh_omegaP=[];
mlh_omegaP=[];

mhl_omegaP=[];
mhml_omegaP=[];
mhmh_omegaP=[];
mhh_omegaP=[];

hl_omegaP=[];
hml_omegaP=[];
hmh_omegaP=[];
hh_omegaP=[];

ll_omegaNne=[];
lml_omegaNne=[];
lmh_omegaNne=[];
lh_omegaNne=[];

mll_omegaNne=[];
mlml_omegaNne=[];
mlmh_omegaNne=[];
mlh_omegaNne=[];

mhl_omegaNne=[];
mhml_omegaNne=[];
mhmh_omegaNne=[];
mhh_omegaNne=[];

hl_omegaNne=[];
hml_omegaNne=[];
hmh_omegaNne=[];
hh_omegaNne=[];

ll_omegaPne=[];
lml_omegaPne=[];
lmh_omegaPne=[];
lh_omegaPne=[];

mll_omegaPne=[];
mlml_omegaPne=[];
mlmh_omegaPne=[];
mlh_omegaPne=[];

mhl_omegaPne=[];
mhml_omegaPne=[];
mhmh_omegaPne=[];
mhh_omegaPne=[];

hl_omegaPne=[];
hml_omegaPne=[];
hmh_omegaPne=[];
hh_omegaPne=[];

omegaN_cat=zeros(outN.*respN,trial_length./dt);
omegaP_cat=zeros(outN.*respN,trial_length./dt);

