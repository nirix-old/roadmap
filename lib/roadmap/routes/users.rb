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
    class Users < Base
      # Set login page title
      before '/login' do
        title t(:login)
      end

      # Set register page title
      before '/register' do
        title t(:register)
      end

      # Login page
      get '/login' do
        view "users/login"
      end

      # Create session
      post '/login' do
        # Check username and password
        if user = User.check_credentials(params[:username], params[:password])
          session[:user_id] = user.id
          redirect '/'
        else
          @error = true
          view "users/login"
        end
      end

      # Register page
      get '/register' do
        @user = User.new
        view "users/register"
      end

      # Create user
      post '/register' do
        # Set user info
        @user = User.new({
          username: params[:user][:username],
          password: params[:user][:password],
          email:    params[:user][:email],
          name:     params[:user][:name],
        })

        # Save user and redirect if valid
        if @user.valid?
          @user.save
          redirect '/'
        else
          view "users/register"
        end
      end
    end # Users
  end # Routes
end # Roadmap
