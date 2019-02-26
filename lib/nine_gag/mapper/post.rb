module NineGag
  module Mapper
    module Post
      extend self

      def collection(posts)
        posts.map do |post|
          Model::Post.new(
            id: post["id"],
            url: post["url"],
            title: post["title"],
            type: post["type"],
            up_vote_count: post["upVoteCount"],
            down_vote_count: post["downVoteCount"],
            creation_ts: post["creationTs"],
            tag_url: post["tags"]
          )
        end
      end
    end
  end
end
