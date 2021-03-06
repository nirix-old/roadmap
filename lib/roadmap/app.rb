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
  ##
  # The "App" class that pulls the routes
  # into one class so they can be found when
  # App.run! is called.
  #
  class App < Core
    use Routes::Admin::Dashboard
    use Routes::Admin::Projects
    use Routes::Admin::Settings
    use Routes::Admin::Statuses
    use Routes::Admin::Types
    use Routes::Errors
    use Routes::Projects
    use Routes::Users
  end
end
