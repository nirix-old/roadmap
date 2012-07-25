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
  # Localization class
  #
  # @copyright Jack P.
  #
  class Language
    @@strings = {}

    def initialize
      compile_string_index(self.strings)
    end

    ##
    # Used to compile a multilevel language hash
    # that contains strings into a single hash
    # by joining indexes.
    #
    # @param [Hash] strings
    # @param [Array] index
    #
    def compile_string_index(strings, index = [])
      if strings.class.to_s == 'String'
        if index.last == :_this
          index.delete(:_this)
        end
        @@strings[index.join('.').gsub('_.','.').to_sym] = strings
      elsif strings.class.to_s == 'Hash'
        strings.each do |i, s|
          compile_string_index(s, index + [i])
        end
      end
    end

    ##
    # Loads the specified locale file.
    #
    # @param [String] locale
    #
    def self.load(locale)
      return Object.const_get("Locale_#{locale}").new
    end

    ##
    # Fetches the localized string
    #
    # @example
    #   Roadmap::Locale.translate(:there_are_x_users_online, 5)
    #
    # @param [Symbol] index
    # @param [Array] Variables to be used in the string
    #
    # @return [String]
    #
    def translate(index, vars = [])
      # Make sure the variables are in an array
      if vars.class.to_s != 'Array'
        vars = [vars]
      end

      # Is the index lookup an array?
      if index.class.to_s == 'Array'
        index = index.join('.')
      end

      # If the index doesn't exist, return it
      return "[#{index.to_s}]" if not @@strings.has_key?(index.to_sym)

      # Compile the string
      compile_string @@strings[index.to_sym], vars
    end

    ##
    # Poorly calculates what replacement to use
    #
    # @param [Integer] i
    #
    # @return [Integer]
    #
    def calculate_numeral(i)
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
    def compile_string(string, vars = [])
      i = 0
      vars.each do |v|
        i += 1
        string = string.gsub("{#{i.to_s}}", v.to_s)
      end

      if matches = string.scan(/{plural:(?<value>\d+)(?<seperator>,|, )\[(?<replacements>.*?)\]}/)
        matches.each do |m|
          replacements = m[2].split("|")
          replacement = replacements[calculate_numeral(m[0].to_i)]

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