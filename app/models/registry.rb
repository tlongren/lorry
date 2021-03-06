require "net/http"

module Lorry
  module Models
    class Registry

      REGISTRY_API_URL = 'https://index.docker.io/v1'

      # Search params: :q - search term, :n - number of results per page, :page - page number of results
      def self.search(params)
        uri = URI.parse("#{REGISTRY_API_URL}/search?#{URI.encode_www_form(params)}")

        Net::HTTP.get_response(uri)
      end

      def self.list_tags(namespace, repository)
        if namespace && repository
          uri = URI("#{REGISTRY_API_URL}/repositories/#{namespace}/#{repository}/tags")
        elsif repository
          uri = URI("#{REGISTRY_API_URL}/repositories/#{repository}/tags")
        end

        Net::HTTP.get_response(uri)
      end
    end
  end
end
