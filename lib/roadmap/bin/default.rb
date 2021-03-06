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
  module Bin
    class Default < Shebang::Command
      command :default
      banner  'Roadmap'
      usage   'roadmap [COMMAND]'

      o :h, :help   , 'Shows this help message'  , method: :help
      o :v, :version, 'Shows the current version', method: :version

      ##
      # Shows help
      #
      def index
        help
      end

      ##
      # Shows version
      #
      def version
        puts Roadmap::VERSION
        exit
      end
    end
  end
end
