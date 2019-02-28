require "net/http"

module NineGag
  module Client
    module HTTP
      extend self

      def get(url, params: {})
        uri = URI(url)
        uri.query = URI.encode_www_form(params)
        Net::HTTP.get_response(uri)
      end

      def post(url, params: {})
        uri = URI(url)
        Net::HTTP.post_form(uri, params)
      end
    end
  end
end
