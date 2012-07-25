#
# Roadmap
# Copyright (C) 2012 Nirix
# https://github.com/nirix
#
# Roadmap is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 only.
#
# Roadmap is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Roadmap. If not, see <http://www.gnu.org/licenses/>.
#

helpers do
  def title(s = nil)
    @title = [] if not @title
    return @title if s === nil
    @title.push s
  end

  def L(string, vars = [])
    LOCALE.translate(string, vars)
  end

  def setting(setting)
    Setting.find(:setting => setting.to_s).value
  end

  def current_project
    @current_project
  end
end