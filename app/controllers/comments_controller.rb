class CommentsController < ApplicationController
  before_action :set_comment, only: %i(show update destroy)
  has_scope :my_comments

  def_param_group :comment do
    param :comment, Hash, :desc => "A comment object", required: true do
      param :login, String, :desc => "Comment author login", required: true
      param :content, String, :desc => "Comment content", required: true
    end
  end

  def_param_group :commentResponse do
    property :id, Integer, desc: "Comment id"
    property :login, String, :desc => "Comment author"
    property :content, String, :desc => "Comment content"
  end

  api :GET, "movies/:movie_id/comments/", "Get all comments"
  param :movie_id, Integer, required: true
  returns :array_of => :commentResponse, :code => 200, :desc => "All comments"

  def index
    @comments = apply_scopes(Comment.all)
  end

  api :POST, 'movies/:movie_id/comments/', "Create comment"
  param :movie_id, Integer, required: true
  param_group :comment
  returns :code => 200, :desc => "Successfully create comment"
  returns :code => 422, :desc => 'Cannot save comment'
  example " 'comment': {
                    'login': 'TestLogin',
                    'content': 'Test content'
                    } "
  formats ['json']

  def create
    @comment = Movie.find(params[:movie_id]).comments.new
    @comment.update(comment_params)
    if @comment.save
      render @comment
    else
      head 422
    end
  end

  api :PUT, 'movies/:movie_id/comments/:id', "Update exists comment"
  param :movie_id, Integer, required: true
  param :id, Integer, required: true, :only_in => :request, desc: 'Comments id'
  param_group :comment
  returns :code => 200, :desc => "Successfully update comment"
  returns :code => 404, :desc => "Comment not found"
  returns :code => 422, :desc => 'Cannot save comment'
  example " 'comment': {
                    'login': 'TestLogin',
                    'content': 'Test content'
                    } "
  formats ['json']

  def update
    token = params[:token].decode
    if token.first[:login] == @comment.login
      if @comment.update(comment_params)
        render @comment
      else
        head 422
      end
    else
      head 401
    end
  end

  api :DELETE, 'movies/:movie_id/comments/:id', "Delete comment"
  param :movie_id, Integer, required: true
  param :id, Integer, required: true, :only_in => :request, desc: 'Comments id'
  returns :code => 200, :desc => "Successfully deletes comment"
  returns :code => 404, :desc => "Comment not found"
  returns :code => 422, :desc => 'Cannot delete comment'

  def destroy
    token = params[:token].decode
    if token.first[:login] == @comment.login
      if @comment.destroy
        head 200
      else
        head 422
      end
    else
      head 401
    end
  end

  def comment_params
    params.require(:comment).permit(:login, :content)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
