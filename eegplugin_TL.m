% eegplugin_TL() - EEGLAB plugin for transfer learning
% EA: an Euclidean alignment approach for cross-subject transfer learning

% Usage:
%   >> eegplugin_EA(fig, try_strings, catch_strings);

% Inputs:
%   fig        - [integer]  EEGLAB figure
%   try_strings    - [struct] "try" strings for menu callbacks.
%   catch_strings- [struct] "catch" strings for menu callbacks.

%<Authors: He He & Dongrui Wu, Huazhong University of Science and Technology, Wuhan, China>
% Reference:
% [1] Transfer Learning for Brain-Computer Interfaces: A Euclidean Space Data Alignment Approach, 
%       IEEE Trans. on Biomedical Engineering, vol. 67, no. 2, pp. 399-410, 2020. 


% Copyright (C) 2020
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

function vers=eegplugin_TL( fig, try_strings, catch_strings)

vers = 'TL 1.0';

%% Approach 1: EA
% create menu 
toolsmenu = findobj(fig, 'tag', 'tools'); 
submenu = uimenu( toolsmenu, 'label', 'Transfer Learning'); 
cmd = [ try_strings.check_epoch '[EEG LASTCOM]= pop_EA(EEG);' catch_strings.add_to_hist ]; 
uimenu( submenu, 'label', 'EA', 'callback', cmd);
