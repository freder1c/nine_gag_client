module NineGag
  module Collection
    class Post < Array
      def self.all(opts = {})
        res = NineGag::Client::HTTP.get(collection_url, params: opts)
        Mapper::Post.collection(Oj.load(res.body).dig("data", "posts"))
      end

      def next_page
        self.class.all(after: self.last&.id)
      end

      private

      def self.collection_url
        "https://9gag.com/v1/group-posts/"
      end
    end
  end
end
