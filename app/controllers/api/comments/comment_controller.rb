class Api::Comments::CommentController < ApplicationController
  skip_before_action :verify_authenticity_token # Disable CSRF protection for API, Only for development purpose
  def create
    comment = CommentRepository.save(comment_payload)
    if comment.valid?
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private
  def comment_payload
    params.require(:comment).permit(:body, :earthquake_id)
  end
end
