function minfo=model_stats(minfo, cmd, varargin)
% MODEL_STATS Short description of model_stats.
%   MODEL_STATS Long description of model_stats.
%
% Options
%
% References
%
% Notes
%
% Example (<a href="matlab:run_example model_stats">run</a>)
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

switch cmd
    case 'reset'
        stats = struct();
        stats.num_solve_calls = 0;
        stats.num_step_calls = 0;
        stats.time_solve_calls = 0;
        stats.time_step_calls = 0;
        minfo.model_stats = stats;
        if nargout==0
            warning('sglib:model_stats', 'There should be an ouput argument, when you use ''reset''');
        end
    case 'print'
        stats = minfo.model_stats;
        fprintf('Solve calls: %d\n', stats.num_solve_calls);
        fprintf('Total time:  %g sec\n', stats.time_solve_calls);
    case 'print_solve_info'
        stats = minfo.model_stats;
        fprintf('Solve calls: %d\n', stats.num_solve_calls);
        fprintf('Total time:  %g sec\n', stats.time_solve_calls);
    case 'print_step_info'
        stats = minfo.model_stats;
        fprintf('Step calls:  %d\n', stats.num_step_calls);
        fprintf('Total time:  %g sec\n', stats.time_step_calls);
    otherwise
        error('sglib:model_stats', 'Unknown command: %s', cmd);
end