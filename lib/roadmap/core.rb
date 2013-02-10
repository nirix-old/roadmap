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
  ROADMAP_DIR = File.dirname(__FILE__)
  class Core < Sinatra::Base
    attr_accessor :database

    # Helpers
    helpers Helpers
    helpers Rocketeer::Helpers::HTML
    helpers Rocketeer::Helpers::Form
    helpers Rocketeer::Helpers::Text

    # Flash messages
    use Rack::Flash, :sweep => true

    # Set root and enable static files
    set root: ROADMAP_DIR
    enable :static

    class << self
      ##
      # Sets the database connection and loads the models.
      #
      # @param [Sequel::Mysql2::Database] database
      #
      def database=(database)
        @database = database

        require "roadmap/models/group"
        require "roadmap/models/permission"
        require "roadmap/models/project"
        require "roadmap/models/setting"
        require "roadmap/models/user"

        include Models
      end
    end
  end
end
