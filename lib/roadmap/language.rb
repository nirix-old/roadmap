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
    # Registered/loaded languages
    REGISTERED = {}

    class << self
      attr_accessor :current_language

      ##
      # Returns the currently used
      # language object.
      #
      def current
        REGISTERED[current_language]
      end

      ##
      # Sets the language to be used.
      #
      def use(language)
        language = language.to_s

        if REGISTERED.has_key?(language)
          @current_language = language
        else
          raise "Unable to use language '#{language}`: not loaded"
        end
      end

      ##
      # Looks up the string by index and compiles
      # the string then returns it.
      #
      # If the index doesn't exist then
      # the index is returned.
      #
      def translate(index, vars = [])
        if index.is_a?(Array)
          index = index.join('.')
        end

        if string = current.compile_string(index.to_s, vars)
          string
        else
          "[#{index}]"
        end
      end
    end
  end
end
