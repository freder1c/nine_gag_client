require "net/http"

module NineGag
  module Client
    module HTTP
      extend self

      def get(path, params: {})
        uri = URI("#{domain}/#{path}")
        uri.query = URI.encode_www_form(params)
        Net::HTTP.get_response(uri)
      end

      def post(path, params: {})
        uri = URI("#{domain}/#{path}")
        Net::HTTP.post_form(uri, params)
      end

      private

      def domain
        "https://9gag.com"
      end
    end
  end
end
