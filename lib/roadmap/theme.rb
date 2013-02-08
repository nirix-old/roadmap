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
  class Theme
    attr_accessor :name, :dir

    REGISTERED = {}

    ##
    # Sets the themes name as a symbol.
    #
    # @param [String] name
    #
    def name=(name)
      @name = name.to_sym
    end

    class << self
      ##
      # Registers a new theme
      #
      def register(&block)
        theme = new
        yield theme
        REGISTERED[theme.name] = theme
      end

      ##
      # Returns the theme, if registered.
      #
      # @return [Theme]
      #
      def [](theme)
        theme = theme.to_sym
        raise "Theme '#{theme}' is not registered" if !REGISTERED.key?(theme)
        return REGISTERED[theme]
      end
    end
  end
end
