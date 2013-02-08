
module Roadmap
  module Models
    class Project < Sequel::Model
      plugin :sluggable, source: :name, frozen: false

      ##
      # Returns the URI for the project
      #
      # @return [String]
      #
      def href(uri = nil)
        slug + (!uri.nil? ? "/#{uri}" :'')
      end
    end
  end
end
