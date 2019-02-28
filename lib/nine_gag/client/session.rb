module NineGag
  module Client
    module Session
      extend self

      attr_reader :username, :cookie

      def create(username, password)
        @username = username
        request_token(password)
      end

      private

      def request_token(password)
        parse_token(HTTP.post("login", params: { username: username, password: password }))
      end

      def parse_token(res)
        @cookie = res.to_hash["set-cookie"]
      end
    end
  end
end
