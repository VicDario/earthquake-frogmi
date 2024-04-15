class CommentRepository
    def self.save(comment_data)
        Comment.create(comment_data)
    end

    def self.get_by_feature_id(feature_id)
        comments = Comment.where(feature_id: feature_id)
        comments.map(&:serialize)
    end
end