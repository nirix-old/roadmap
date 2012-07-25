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

get '/login' do
  view 'users/login'
end

post '/login' do
  if u = User.check_credentials(params[:user][:username], params[:user][:password])
    session[:user_id] = u.id
    redirect '/'
  else
    @error = true
    view 'users/login'
  end
end

get '/register' do
  @user = User.new
  view 'users/register'
end

post '/register' do
  #@user = User.new {
  #  :username => params[:user][:username],
  #  :password => params[:user][:password],
  #  :email => params[:user][:email]
  #}

  if @user.valid?
    @user.save
    flash[:success] = L(:registration_successfull)
    redirect '/login'
  else
    view 'users/register'
  end
end