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

Dir.glob(File.dirname(__FILE__) + '/**/*.rb').each do |node|
  require(node)
end

before do
  title setting(:title)
  Roadmap::Language.current = Setting.find(setting: 'locale').value
end

before '/:project_slug*' do
  @current_project = Project.is_project(params[:project_slug])
  title @current_project.name if @current_project
end