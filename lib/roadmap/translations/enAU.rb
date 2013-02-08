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
        t['register']  = "Register"
        t['username']  = "Username"
        t['password']  = "Password"
        t['email']     = "Email"
        t['full_name'] = "Full name"
        t['guest']     = "Guest"

        # Global
        t['admincp']          = "AdminCP"
        t['activity']         = "Activity"
        t['projects']         = "Projects"
        t['issues']           = "Issues"
        t['roadmap']          = "Roadmap"
        t['timeline']         = "Timeline"

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

        # Errors
        t['errors.invalid_username_or_password'] = "Invalid username and/or password"
        t['errors.404.title'] = "He's dead, Jim!"
        t['errors.404.title.serious'] = "Not Found"
        t['errors.404.message'] = "The page you're looking for... well, it's not here, sorry."
      end
    end
  end
end
