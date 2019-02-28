module NineGag
  module Model
    class Post < Base
      attr_accessor :id, :url, :title, :type, :up_vote_count, :down_vote_count, :creation_ts, :tag_url, :comments_count
    end
  end
end
