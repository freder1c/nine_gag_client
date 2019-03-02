require "net/http"
require "oj"

module NineGag
  module Client
    module HTTP
      extend self

      def get(url, params: {})
        uri = URI(url)
        uri.query = URI.encode_www_form(params)
        response = Net::HTTP.get_response(uri)

        case response
        when Net::HTTPSuccess then Oj.load(response.body)
        else raise HTTPConnectionError
        end
      end

      def post(url, params: {})
        uri = URI(url)
        Net::HTTP.post_form(uri, params)
      end

      class HTTPConnectionError < StandardError
      end
    end
  end
end
