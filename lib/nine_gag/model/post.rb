require 'pry'

module NineGag
  module Model
    class Post < Base
      attr_accessor :id, :url, :title, :type, :up_vote_count, :down_vote_count, :creation_ts, :tag_url

      def self.all
        res = NineGag::Client::HTTP.get("/v1/group-posts/")
        Mapper::Post.collection(Oj.load(res.body).dig("data", "posts"))
      rescue
        []
      end
    end
  end
end
