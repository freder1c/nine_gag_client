module NineGag
  module Collection
    class Post < Array
      def next_page
        Model::Post.all(after: self.last&.id)
      end
    end
  end
end
