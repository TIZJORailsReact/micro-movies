class MoviesController < ApplicationController
  has_scope :drama_scope, type: :boolean
  has_scope :comedy_scope, type: :boolean
  has_scope :action_scope, type: :boolean
  has_scope :horror_scope, type: :boolean
  has_scope :thriller_scope, type: :boolean
  has_scope :animation_scope, type: :boolean

  def index
    @movies = apply_scopes(Movies.all)
  end

  def show
    @movie = Movies.find(params[:id])
  end
end
