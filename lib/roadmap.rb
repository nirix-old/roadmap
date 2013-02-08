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

require "sinatra/base"
require "sequel"
require "rocketeer"
require "roadmap/version"
require "roadmap/theme"
require "roadmap/themes/default"
require "roadmap/helpers/roadmap"
require "roadmap/helpers/views"
require "roadmap/core"
require "roadmap/routes/base"
require "roadmap/routes/errors"
require "roadmap/routes/projects"
require "roadmap/app"

module Roadmap
  class << self
    ##
    # Starts Sinatra
    #
    def start
      App.run!
    end

    ##
    # Configure block
    #
    def config(&block)
      block.call(Core)

      # Set sessions
      Core.set sessions: {
        key: "_roadmap_session",
        secret: Core.settings.session_secret,
        expire_after: 13000000
      }
    end
  end
end
