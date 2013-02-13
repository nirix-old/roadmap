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

##
# English localization
#
# @author J. Polgar
# @copyright J.Polgar
#
module Roadmap
  module Translations
    Language::Translation.add do |translation|
      translation.name = "English [AU]"
      translation.language = :enAU

      translation.translate do |t|
        t['copyright'] = "Powered by Roadmap #{Roadmap::VERSION}, &copy; #{Time.now.year} Roadmap"

        # Users
        t['login']     = "Login"
        t['logout']    = "Logout"
        t['usercp']    = "UserCP"
        t['register']  = "Register"
        t['name']      = "Name"
        t['username']  = "Username"
        t['password']  = "Password"
        t['email']     = "Email"
        t['full_name'] = "Full name"
        t['guest']     = "Guest"
        t['logout_successful'] = "Successfully logged out"

        # Global
        t['admincp']  = "AdminCP"
        t['activity'] = "Activity"
        t['projects'] = "Projects"
        t['issues']   = "Issues"
        t['roadmap']  = "Roadmap"
        t['timeline'] = "Timeline"
        t['info']     = "Info"
        t['admin']    = "Admin"
        t['actions']  = "Actions"
        t['new']      = "New"
        t['edit']     = "Edit"
        t['delete']   = "Delete"
        t['slug']     = "Slug"
        t['create']   = "Create"

        # Issues
        t['description']      = "Description"
        t['summary']          = "Summary"
        t['status']           = "Status"
        t['priority']         = "Priority"
        t['assignee']         = "Assignee"
        t['component']        = "Component"
        t['milestone']        = "Milestone"
        t['affected_version'] = "Affected version"
        t['reported_by']      = "Reported by"
        t['reported']         = "Reported"
        t['updated']          = "Updated"
        t['never']            = "Never"
        t['x_open']           = "{1} Open"
        t['type']             = "Type"

        # Admin
        t['new_project'] = "New Project"
        t['project_deleted_successfully'] = "Project deleted successfully"

        # Project settings
        t['enable_wiki'] = "Enable wiki"

        # Placeholders
        t['placeholder.new_project.name'] = "My Project"
        t['placeholder.new_project.slug'] = "my-project"

        # Help
        t['help.slug'] = "URL safe string."

        # Errors
        t['errors.invalid_username_or_password'] = "Invalid username and/or password"
        t['errors.404.title'] = "He's dead, Jim!"
        t['errors.404.title.serious'] = "Not Found"
        t['errors.404.message'] = "The page you're looking for... well, it's not here, sorry."
        t['errors.x_is_not_present'] = "{1} is not present"
        t['errors.x_is_already_taken'] = "{1} is already taken"
      end
    end
  end
end
