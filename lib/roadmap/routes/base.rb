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
    class Base < Roadmap::Core
      before do
        title setting(:title)
        set_translation setting(:language)

        # Get user
        if session[:user_id]
          @current_user = User.find(id: session[:user_id])
        else
          @current_user = User.new(username: t(:guest), group_id: 3)
        end
      end

      before '/:project_slug*' do
        @current_project = Project.where(slug: params[:project_slug]).first

        if @current_project and !@current_user.can?(:view, @current_project.id)
          error 403, view('errors/no_permission')
        end
      end
    end
  end
end
