% EA( ) -- Re-center the covariance matrices of trials from a
%               subject/sessions at the identity matrix.
%
% Note: EA is designed in the context of transfer learning, for purpose of 
%           aligning EEG data from different subjects /sessions. The distributions
%           of different subjects /sessions are expected to be more similar after 
%           performing EA on these subjects /sessions independently.          
          
% Usage:
%   >>  X_out = sample( X );
%
% Inputs:
%   X     -  input of the function: EEG epochs of a subject/session
%              3-D array (Channels, frames, trials)
%              **Channels: number of channels
%              **frames: number of time domain samples
%              **trials: number of trials
%
% Outputs:
%   X_out   - output of the function: EEG epochs after EA alignment
%
% See also: 
%   POP_EA, EEGLAB 

% Copyright (C) <2020>  
%<Authors: He He & Dongrui Wu, Huazhong University of Science and Technology, Wuhan, China>
%
% Reference:
% [1] Transfer Learning for Brain-Computer Interfaces: A Euclidean Space Data Alignment Approach, 
%       IEEE Trans. on Biomedical Engineering, vol. 67, no. 2, pp. 399-410, 2020. 
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

function X_out = EA( X )

[Ne , Ns, Nt] = size(X);

COV=nan(Ne,Ne,Nt);
for i=1:Nt
    COV(:,:,i) = cov(X(:,:,i)');
end
R=(mean(COV,3)^(-1/2));
X_out=nan(Ne , Ns, Nt);
for i=1:Nt
    X_out(:,:,i) = R*X(:,:,i);
end
