module NineGag
  module Collection
    class Comment < Array
      def self.for_post(post_id, opts = {})
        res = Client::HTTP.get(collection_url, params: collection_params(post_id).merge(opts))
        Mapper::Comment.collection(post_id, Oj.load(res.body).dig("payload", "comments"))
      end

      def next_page
        return self.new unless self.last

        self.class.for_post(self.last.post_id, { ref: self.last.order_key })
      end

      private

      def self.collection_url
        "https://comment-cdn.9gag.com/v1/cacheable/comment-list.json"
      end

      def self.collection_params(post_id)
        {
          appId: "a_dd8f2b7d304a10edaf6f29517ea0ca4100a43d1b",
          url: "http://9gag.com/gag/#{post_id}",
          count: 10,
          order: :score,
          origin: "https://9gag.com"
        }
      end
    end
  end
end
