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
      class Statuses < Base
        # Ticket status listing
        get '/admin/statuses' do
          @statuses = Status.order_by(:is_global.desc, :name.asc).all
          view 'admin/statuses/index'
        end

        # New status
        get '/admin/statuses/new' do
          @status = Status.new({ is_global: 1 })
          view 'admin/statuses/new'
        end

        # Create status
        post '/admin/statuses/new' do
          @status = Status.new({
            name: params[:status][:name],
            is_open: params[:status][:is_open] || 0,
            is_global: 1
          })

          if @status.valid?
            @status.save
            redirect '/admin/statuses'
          end

          view 'admin/statuses/new'
        end

        # Edit status
        get '/admin/statuses/:id/edit' do
          @status = Status.find(id: params[:id])
          view 'admin/statuses/edit'
        end

        # Save status
        post '/admin/statuses/:id/edit' do
          @status = Status.find(id: params[:id])
          @status.name = params[:status][:name]
          @status.is_open = params[:status][:is_open] || 0

          if @status.valid?
            @status.save
            redirect '/admin/statuses'
          end

          view 'admin/statuses/edit'
        end
      end # Statuses
    end # Admin
  end # Routes
end # Roadmap
