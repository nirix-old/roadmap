#
# Roadmap
# Copyright (C) 2012-2013 J. Polgar
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

module Roadmap
  module Routes
    module Admin
      class Projects < Base
        before '/admin/projects*' do
          title t(:projects)
        end

        # Project listing
        get '/admin/projects' do
          @projects = Project.all
          view 'admin/projects/index'
        end

        # New project
        get '/admin/projects/new' do
          @project = Project.new
          view 'admin/projects/new'
        end

        # Create project
        post '/admin/projects/new' do
          @project = Project.new({
            name: params[:project][:name],
            slug: params[:project][:slug],
            description: params[:project][:description],
            enable_wiki: params[:project][:enable_wiki] || 0
          })

          if @project.valid?
            @project.save
            redirect '/admin/projects'
          end

          view 'admin/projects/new'
        end

        # Delete project
        get '/admin/projects/:id/delete' do
          Project.find(id: params[:id]).delete
          flash[:success] = t(:project_deleted_successfully)
          redirect '/admin/projects'
        end
      end # Projects
    end # Admin
  end # Routes
end # Roadmap
