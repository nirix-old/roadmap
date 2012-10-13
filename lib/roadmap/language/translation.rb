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
  class Language
    ##
    # Translation class
    #
    class Translation
      attr_accessor :name
      attr_accessor :language
      attr_accessor :strings
      attr_accessor :string_compiler
      attr_accessor :numeral_calculator

      def self.add
        translation = new
        yield(translation)
        REGISTERED[translation.language] = translation
      end

      def initialize
        @strings = {}
      end

      def name=(name)
        @name = name.to_s
      end

      def language=(language)
        @language = language.to_s
      end

      def translate
        yield self
      end

      def []=(key, value)
        @strings[key] = value
      end

      ##
      # Poorly calculates what replacement to use
      #
      # @param [Integer] i
      #
      # @return [Integer]
      #
      def calculate_numeral(i)
        return @numeral_calculator.call(i) if @numeral_calculator

        if i > 1 or i < -1 or i == 0
          1
        else
          0
        end
      end

      ##
      # Compiles the string with passed variables, if any.
      #
      # @param [String] string
      # @param [Array] vars
      #
      # @return [String]
      #
      def compile_string(key, vars = [])
        # Make sure we're dealing with an array
        if not vars.is_a?(Array)
          vars = [vars]
        end

        # Make sure the string index exists
        if @strings[key]
          string = @strings[key]
        else
          return false
        end

        return @string_compiler.call(key, vars) if @string_compiler

        # Convert {x} to appropriate string variable
        i = 0
        vars.each do |v|
          i += 1
          string = string.gsub("{#{i.to_s}}", v.to_s)
        end

        # Match {plural:x, [y, x]}
        if matches = string.scan(/{plural:(?<value>\d+)(?<seperator>,|, )\[(?<replacements>.*?)\]}/)
          matches.each do |m|
            replacements = m[2].split("|")
            replacement = replacements[calculate_numeral(m[0].to_i)]

            # Use last replacement?
            if not replacement
              replacement = replacements.last
            end

            string = string.gsub("{plural:#{m[0]}#{m[1]}[#{m[2]}]}", replacement)
          end
        end

        string
      end

    end
  end
end
