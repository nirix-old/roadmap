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
    class Project < Sequel::Model
      plugin :sluggable, source: :name, frozen: false

      ##
      # Returns the URI for the project
      #
      # @return [String]
      #
      def href(uri = nil)
        slug + (!uri.nil? ? "/#{uri}" :'')
      end

      def validate
        validates_presence [:name, :slug]
        validates_unique [:slug]
      end
    end
  end
end
