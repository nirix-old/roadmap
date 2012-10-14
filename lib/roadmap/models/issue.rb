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

class Issue < Sequel::Model
  many_to_one :project
  many_to_one :user
  many_to_one :assignee, :class => :User
  many_to_one :type
  many_to_one :status
  many_to_one :priority
  many_to_one :milestone, :class => :Version
  many_to_one :version
  many_to_one :component

  def href
    "/#{project.slug}/issues/#{issue_id}"
  end
end