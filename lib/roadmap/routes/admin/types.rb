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
      class Types < Base
        # Ticket type listing
        get '/admin/types' do
          @types = Type.order_by(:is_global.desc, :name.asc).all
          view 'admin/types/index'
        end

        # New type
        get '/admin/types/new' do
          @type = Type.new({ is_global: 1 })
          view 'admin/types/new'
        end

        # Create type
        post '/admin/types/new' do
          @type = Type.new({
            name: params[:type][:name],
            is_global: 1
          })

          if @type.valid?
            @type.save
            redirect '/admin/types'
          end

          view 'admin/types/new'
        end

        # Edit type
        get '/admin/types/:id/edit' do
          @type = Type.find(id: params[:id])
          view 'admin/types/edit'
        end

        # Save type
        post '/admin/types/:id/edit' do
          @type = Type.find(id: params[:id])
          @type.name = params[:type][:name]

          if @type.valid?
            @type.save
            redirect '/admin/types'
          end

          view 'admin/types/edit'
        end

        # Delete type
        get '/admin/types/:id/delete' do
          @type = Type.find(id: params[:id]).delete
          flash[:success] = t(:type_deleted_successfully)
          redirect '/admin/types'
        end
      end # Base
    end # Admin
  end # Routes
end # Roadmap
