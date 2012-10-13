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

module Roadmap
  ##
  # Language class
  #
  # @copyright Jack P.
  #
  class Language
    REGISTERED = {}

    class << self
      attr_accessor :current
    end

    def self.translate(index, vars = [])
      current_language = REGISTERED[current.to_s]

      if index.is_a?(Array)
        index = index.join('.')
      end

      if string = current_language.compile_string(index.to_s, vars)
        string
      else
        "[#{index}]"
      end
    end
  end
end
