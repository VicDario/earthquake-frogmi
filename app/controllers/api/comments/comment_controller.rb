class Api::Comments::CommentController < ApplicationController
  skip_before_action :verify_authenticity_token # Disable CSRF protection for API, Only for development purpose

  def index
    feature_id = params[:feature_id]
    
    if feature_id.nil?
      render json: { error: 'Feature ID is required' }, status: :bad_request
      return
    end

    comments = CommentRepository.get_by_feature_id(feature_id)
    render json: comments
  end

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
    params.require(:comment).permit(:body, :feature_id)
  end
end
