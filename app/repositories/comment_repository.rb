class CommentRepository
    def self.save(comment_data)
        Comment.create(comment_data)
    end

    def self.get_by_earthquake_id(earthquake_id)
        comments = Comment.where(earthquake_id: earthquake_id)
        comments.map(&:serialize)
    end
end