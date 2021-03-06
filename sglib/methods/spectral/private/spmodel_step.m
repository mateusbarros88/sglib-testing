function [sol, spmodel] = spmodel_step(spmodel, old_sol, params, varargin)
% SPMODEL_STEP Short description of spmodel_step.
%   SPMODEL_STEP Long description of spmodel_step.
%
% Options
%
% References
%
% Notes
%
% Example (<a href="matlab:run_example spmodel_step">run</a>)
%
% See also

%   Elmar Zander
%   Copyright 2014, Inst. of Scientific Computing, TU Braunschweig
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.


step_func = spmodel.model_info.step_func;
start = tic;
[sol, spmodel]=funcall(step_func, spmodel, old_sol, params, varargin{:});
t = toc(start);
spmodel.spmodel_stats.num_step_calls = spmodel.spmodel_stats.num_step_calls + 1;
spmodel.spmodel_stats.time_step_calls = spmodel.spmodel_stats.time_step_calls + t;
