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
    # Sets the translation to be used.
    #
    # @param [String] translation
    #
    def set_translation(translation)
      Roadmap::Language.use translation
    end

    ##
    # Translates the string.
    #
    # @param [String] string
    # @param [Array]  vars
    #
    # @return [String]
    #
    def t(string, vars = [])
      Roadmap::Language.translate(string, vars)
    end
  end
end
