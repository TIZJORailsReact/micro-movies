class Comment < ApplicationRecord
  belongs_to :movie

  validates :login, presence: true

  scope :my_comments, -> (login) do
    where(login: login)
  end

  scope :movie_comments, -> (movie_id) do
    where(movie_id: movie_id)
  end
end
