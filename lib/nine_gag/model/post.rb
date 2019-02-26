module NineGag
  module Model
    class Post < Base
      attr_accessor :id, :url, :title, :type, :up_vote_count, :down_vote_count, :creation_ts, :tag_url, :comments_count

      def self.all(opts = {})
        res = NineGag::Client::HTTP.get("/v1/group-posts/", params: opts)
        Mapper::Post.collection(Oj.load(res.body).dig("data", "posts"))
      end
    end
  end
end
