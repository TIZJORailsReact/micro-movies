class MoviesController < ApplicationController
  before_action :my_like, only: :show
  before_action :set_recommended, only: :index

  has_scope :drama_scope, type: :boolean
  has_scope :comedy_scope, type: :boolean
  has_scope :action_scope, type: :boolean
  has_scope :horror_scope, type: :boolean
  has_scope :thriller_scope, type: :boolean
  has_scope :animation_scope, type: :boolean

  def_param_group :movie do
    property :id, Integer, desc: "Movie id"
    property :title, String, :desc => "Movie title"
    property :genre, ['drama', 'comedy', 'action', 'horror', 'thriller', 'animation'], :desc => "Movie genre"
    property :link, String, :desc => "Link to movie"
  end

  api :GET, "movies/", "Get all movies"
  returns :array_of => :movie, :code => 200, :desc => "All movies"
  def index
    @movies = apply_scopes(Movie.all)
  end

  def favorites
    @movies = Movie.liked(params[:login])
  end

  api :GET, "movies/:id", "Get specific movie"
  param :id, String, desc: "Movie id", required: true
  returns :movie, :code => 200, :desc => "Specific movie"
  def show
    @movie = Movie.find(params[:id])
    render @movie, locals: { movie: @movie, my_like: my_like}
  end

  def my_like
    @movie.likes.find_by(user: params[:login]).present?
  end

  def set_recommended
    @recommended = Movie.recommended(params[:login])
  end
end
