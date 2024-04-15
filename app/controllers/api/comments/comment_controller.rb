class Api::Comments::CommentController < ApplicationController
  skip_before_action :verify_authenticity_token # Disable CSRF protection for API, Only for development purpose

  def index
    earthquake_id = params[:earthquake_id]
    
    if earthquake_id.nil?
      render json: { error: 'Earthquake ID is required' }, status: :bad_request
      return
    end

    comments = CommentRepository.get_by_earthquake_id(earthquake_id)
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
    params.require(:comment).permit(:body, :earthquake_id)
  end
end
