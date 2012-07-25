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

##
# English localization
#
# @author Jack P.
# @copyright Jack P.
#
class Locale_enAU < Roadmap::Language
  ##
  # Returns the localization info
  #
  # @return [Hash]
  #
  def info
    {
      :name => "English",
      :name_short => :en,
      :locale => :AU,
      :dir => 'ltr',
      :author => "Jack P."
    }
  end

  ##
  # Returns the localization strings
  #
  # @return [Hash]
  #
  def strings
    {
      :copyright => "Powered by Roadmap #{Roadmap::VERSION}, &copy; #{Time.now.year} Roadmap",

      :login => 'Login',
      :logout => 'Logout',
      :register => 'Register',
      :admincp => 'AdminCP',

      :activity => 'Activity',
      :projects => 'Projects',
      :issues => 'Issues',
      :roadmap => 'Roadmap',
      :timeline => 'Timeline',
      :description => 'Description',
      :summary => 'Summary',
      :status => 'Status',
      :priority => 'Priority',
      :assignee => 'Assignee',
      :component => 'Component',
      :milestone => 'Milestone',
      :affected_version => 'Affected version',
      :reported_by => 'Reported by',
      :reported => 'Reported',
      :updated => 'Updated',

      :username => 'Username',
      :password => 'Password',
      :email => 'Email',
      
      :never => 'Never',

      :x_open => '{1} Open',

      # Errors
      :errors => {
        :invalid_username_or_password => 'Invalid username and/or password'
      }
    }
  end
end