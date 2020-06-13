% pop_EA( ) -- Re-center the covariance matrices of trials from a
%               subject/sessions at the identity matrix.
%
% Note: EA is designed in the context of transfer learning, for purpose of 
%           aligning EEG data from different subjects /sessions. The distributions
%           of different subjects /sessions are expected to be more similar after 
%           performing EA on these subjects /sessions independently.   
%
% Usage:
%   >>  OUTEEG = pop_EA( INEEG );
%
% Inputs:
%   INEEG   - input EEG dataset
  
% Outputs:
%   OUTEEG  - output dataset
%
% See also:
%   EA, EEGLAB 

% Copyright (C) <2020>  
%<Authors: He He & Dongrui Wu, Huazhong University of Science and Technology, Wuhan, China>
%
% Reference:
% [1] Transfer Learning for Brain-Computer Interfaces: A Euclidean Space Data Alignment Approach, 
%       IEEE Trans. on Biomedical Engineering, vol. 67, no. 2, pp. 399-410, 2020. 


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

function [EEG, com] = pop_EA( EEG )

% the command output is a hidden output that does not have to
% be described in the header

com = ''; % this initialization ensure that the function will return something
          % if the user press the cancel button            

% display help if not enough arguments
% ------------------------------------
if nargin < 1
	help pop_EA;
	return;
end

% call function EA
% ---------------------------------------------------
EEG.data=EA( EEG.data );


% return the string command
% -------------------------
com = sprintf('pop_EA( %s );', inputname(1));

return
