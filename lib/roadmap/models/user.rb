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
  module Models
    class User < Sequel::Model
      many_to_one :group

      ##
      # Returns the path for the users profile.
      #
      # @return [String]
      #
      def href
        "/profiles/#{id}"
      end

      ##
      # Checks if the user has permission to perform
      # the specified action.
      #
      # @param [Symbol]  action     Action being performed
      # @param [Integer] project_id Project ID
      #
      # @return [Boolean]
      #
      def can?(action, project_id = nil)
        project_id = @current_project.id if project_id.nil?
        Permission.can?(group, project_id, action)
      end

      ##
      # Checks if the password matches the users password.
      #
      # @return [Boolean]
      #
      def check_password(pass)
        BCrypt::Password.new(password) == pass
      end

      ##
      # Checks the username and password and returns the
      # user if one if found.
      #
      # @return [Object]
      #
      def self.check_credentials(user, pass)
        if user = find(username: user) and user.check_password(pass)
          return user
        end

        false
      end

      def validate
        super
        validates_presence [:username, :password, :email]
        validates_unique [:username, :email]
      end
    end
  end
end
