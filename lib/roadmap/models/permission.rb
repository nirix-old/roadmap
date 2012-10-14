#
# Roadmap
# Copyright (C) 2012 Jack Polgar
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

class Permission < Sequel::Model
  def can?(context, project_id, action)
    action = action.to_s

    default = find(context: context.class, context_id: 0, project_id: 0, action: action)
    project_default = find(ccontext: context.class, ontext_id: context.id, project_id: project_id, action: action)
    actual = find(context: context.class, context_id: context.id, project_id: project.id, action: action)

    if actual
      actual.allowed?
    elsif project_default
      project_default.allowed?
    elsif default
      default.allowed?
    else
      false
    end
  end

  def allowed?
    value == 1 or value == true
  end
end