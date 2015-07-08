function [y_k_i] = trig_basis_eval(TB, x_l_i, varargin)
% TRIG_BASIS_EVAL Evaluates sequence of trigonometric basis functions.
%   [Y_K_I] = TRIG_BASIS_EVAL(WP_K_L, X_L_I)  evaluate the trigonometric
%   basis functions represented by the amplitude array A_K and the
%   frequency/phase array WP_K_L at the point X_L_I. The output is given by
%      Y_K_I = \sum_L A_K(K) sin(WP_K_L(2K-1,L)*X_L_I + WP_K_L(2K,L))
%   If the A_K is empty, it is assumed the amplitudes are 1.
%
% Example (<a href="matlab:run_example trig_basis_eval">run</a>)
%
% See also TRIG_EVAL

%   Elmar Zander
%   Copyright 2015, Inst. of Scientific Computing
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

options=varargin2options(varargin, mfilename);
[make_unique, options]=get_option(options, 'make_unique', true);
check_unsupported_options(options);

w_k_l = TB{1};
p_k_l = TB{2};
if length(TB)>=3
    a_k = TB{3};
else
    a_k = [];
end

if isempty(a_k)
    y_k_i = ones(size(w_k_l, 1), size(x_l_i, 2));
else
    a_k = a_k(:);
    y_k_i = repmat(a_k, 1, size(x_l_i, 2));
end

tau = 2*pi;
for l=1:size(x_l_i,1)
    if make_unique
        [wp_k, ~, k_ind] = unique([w_k_l(:,l), p_k_l(:,l)], 'rows');
        arg = binfun(@plus, wp_k(:,1)*x_l_i(l,:), wp_k(:,2));
        sin_arg = sin(tau * arg);
        y_k_i = y_k_i .* sin_arg(k_ind,:);
    else
        arg = binfun(@plus, w_k_l(:,l)*x_l_i(l,:), p_k_l(:,l));
        sin_arg = sin(tau * arg);
        y_k_i = y_k_i .* sin_arg;
    end
end
