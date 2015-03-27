function legend_parametric(format, values)
% LEGEND_PARAMETRIC Add parametric legend to plot.
%   LEGEND_PARAMETRIC(FORMAT, VALUES) adds entries to the legend of the
%   current plot which are generated by SPRINTF(FORMAT, VALUES(I)).
%
% Example (<a href="matlab:run_example legend_parametric">run</a>)
%   clf; 
%   x = linspace(0, 1);
%   plot(x, (1-x).^2, x, (1-x).^3, x, (1-x).^4);
%   legend_parametric('y=(1-x)^%d', [2, 3, 4]);
%
% See also LEGEND_ADD, LEGEND

%   Elmar Zander
%   Copyright 2015, Inst. of Scientific Computing, TU Braunschweig
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

text_array=cellfun( @(x)(sprintf(format,x) ), num2cell( values ), 'UniformOutput', false );
legend_add(text_array);
