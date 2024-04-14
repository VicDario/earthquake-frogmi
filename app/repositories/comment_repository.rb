class CommentRepository
    def self.save(comment_data)
        Comment.create(comment_data)
    end
end