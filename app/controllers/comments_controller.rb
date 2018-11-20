class CommentsController < ApplicationController
  before_action :set_comment, only: %i(show update destroy)
  has_scope :my_comments
  has_scope :movie_comments

  def index
    @comments = apply_scopes(Comment.all)
  end

  def create
    if @comment.save(comment_params)
      render @comment
    else
      head 422
    end
  end

  def update
    if @comment.update(comment_params)
      render @comment
    else
      head 422
    end
  end

  def destroy
    if @comment.destroy
      head 200
    else
      head 422
    end
  end

  def comment_params
    params.require(:comment).permit(:movie_id, :user_id, :content)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
