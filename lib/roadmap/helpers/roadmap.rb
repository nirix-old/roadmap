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
  module Helpers
    ##
    # Sets (or returns) the title.
    #
    # @param [String] t
    #
    # @return [Array]
    #
    def title(t = nil)
      @title ||= []
      return @title if t.nil?
      @title.push t
    end

    ##
    # Returns the value of the setting
    #
    # @param [Symbol] setting
    #
    # @return [Mixed]
    #
    def setting(setting)
      setting = setting.to_s
      Roadmap::Models::Setting.find(setting: setting).value
    end

    ##
    # Returns the current users model.
    #
    # @return [Object]
    #
    def current_user
      @current_user
    end

    ##
    # Returns the current projects model.
    #
    # @return [Object]
    #
    def current_project
      @current_project
    end
  end
end
