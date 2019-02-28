module NineGag
  module Model
    class Comment < Base
      attr_accessor :id, :post_id, :url, :parent_id, :user_id, :text, :timestamp, :order_key, :like_count, :dislike_count
    end
  end
end
