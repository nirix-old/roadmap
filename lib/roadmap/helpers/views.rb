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
    # Easily render a view.
    #
    # @param [Symbol] view    The view the load
    # @param [Hash]   options Options for the view
    #
    # @return [String]
    #
    def view(view, options = {})
      options[:layout].to_sym if options[:layout]
      Roadmap::Core.set :views => Theme[setting(:theme)].dir
      erb "#{view.to_sym}".to_sym, {:layout => :"layouts/#{settings.layout}"}.merge(options)
    end

    ##
    # Render a partial view.
    #
    # @param [Symbol] view Partial to render
    # @param [Hash]   vars Variables to pass to the view
    #
    # @return [String]
    #
    def render_partial(view, vars = {})
      template_array = view.to_s.split('/')
      view = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
      erb(view.to_sym, :locals => vars, :layout => false)
    end

    ##
    # Renders the error list partial.
    #
    # @param [Array] errors
    #
    # @return [String]
    #
    def show_errors(errors)
      render_partial('errors/error_list', errors: errors) if errors.count > 0
    end

    ##
    # Returns an array of themes formatted
    # for the select helper.
    #
    # @return [Array]
    #
    def theme_select_options
      themes = []

      Roadmap::Theme::REGISTERED.each do |theme|
        themes << [theme[0].to_s, theme[0].to_s]
      end

      themes
    end
  end
end
