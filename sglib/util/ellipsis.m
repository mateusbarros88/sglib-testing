function tag=ellipsis()
% ELLIPSIS This is just a tag for positional arguments in FUNCREATE.
%   ELLIPSIS does nothing. You're not supposed to call it. It is just a
%   typesafe placeholder for positional arguments. See the help to
%   FUNCREATE on examples how to use it.
%
% Note: you rather want to use FUNARG. ELLIPSIS is only used in the rare
%   circumstance that you only know the arguments you want to have
%   partially applied come last, but cannot be sure how many arguments come
%   before that.
%
% See also FUNCREATE, FUNARG, FUNCALL

%   Elmar Zander
%   Copyright 2013, Inst. of Scientific Computing, TU Braunschweig
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

tag=@ellipsis;
