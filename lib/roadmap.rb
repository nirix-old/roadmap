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

require 'sinatra'
require 'rocketeer'
require 'sequel'
require 'redcarpet'

DIR = File.dirname(__FILE__)

require "roadmap/version"
require "roadmap/language"
require "roadmap/language/translation"
require "roadmap/locale/init"

require "./config/database"
require "./config/app"

configure do
  set :sessions => {
    :key => 'roadmap',
    :secret => SESSION_SECRET,
    :expire_after => 12345678 # Yeah, really
  }

  set :views => "#{DIR}/roadmap/views"
  set :public_folder => "./public"
end

require "roadmap/models/init"
require "roadmap/helpers/init"

MARKDOWN = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)

require "roadmap/routes/init"