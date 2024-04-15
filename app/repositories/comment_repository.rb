class CommentRepository
    def self.save(comment_data)
        puts comment_data
        Comment.create(comment_data)
    end

    def self.get_by_earthquake_id(feature_id)
        comments = Comment.where(earthquake_id: feature_id)
        comments.map(&:serialize)
    end
end