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

before '/:project_slug/issues(.*)' do
  title t(:issues)
end

get '/:project_slug/issues' do
  @issues = Issue.where(:project_id => current_project.id).all
  view 'issues/index'
end

get '/:project_slug/issues/:issue_id' do
  @issue = Issue.find(issue_id: params[:issue_id])
  title @issue.summary
  view 'issues/view'
end