class Comment < ApplicationRecord
  belongs_to :movie

  validates :user_id, presence: true

  scope :my_comments, -> (user_id) do
    where(user_id: user_id)
  end

  scope :movie_comments, -> (movie_id) do
    where(movie_id: movie_id)
  end
end
