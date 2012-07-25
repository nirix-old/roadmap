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

class Project < Sequel::Model
  plugin :sluggable, :source => :name, :frozen => false

  one_to_many :issues

  def self.is_project(slug)
    if p = find(:slug => slug)
      p
    else
      false
    end
  end

  def href(uri = '')
    "/#{slug}#{uri}"
  end
end