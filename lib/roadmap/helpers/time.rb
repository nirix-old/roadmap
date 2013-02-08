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
    # Nice and easy time ago helper.
    #
    # @param [Fixnum] timestamp
    # @param [Fixnum] from_timestamp
    #
    # @return [String]
    #
    # @todo Add translation support
    #
    def time_ago(timestamp, from_timestamp = nil)
      return t(:never) if timestamp.nil? or timestamp === 0

      from_timestamp = Time.now.to_i if from_timestamp.nil?

      difference = from_timestamp - timestamp
      periods    = ['second', 'minute', 'hour', 'day', 'week', 'month', 'year', 'decade']
      lengths    = [60, 60, 24, 7, 4.35, 12, 10]

      i = 0
      while difference >= lengths[i]
        difference /= lengths[i]
        i += 1
      end

      difference = difference.ceil
      periods[i] = periods[i] +'s' if difference != 1

      return "#{difference} #{periods[i]} ago"
    end
  end
end
