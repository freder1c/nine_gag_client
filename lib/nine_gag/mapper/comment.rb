module NineGag
  module Mapper
    module Comment
      extend self

      def collection(post_id, comments)
        Collection::Comment.new(comments.map { |comment|
          Model::Comment.new(
            id: comment["commentId"],
            post_id: post_id,
            url: comment["permalink"],
            parent_id: comment["parent"],
            user_id: comment["userId"],
            text: comment["text"],
            timestamp: comment["timestamp"],
            order_key: comment["orderKey"],
            like_count: comment["likeCount"],
            dislike_count: comment["dislikeCount"]
          )
        })
      end
    end
  end
end
