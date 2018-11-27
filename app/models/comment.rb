class Comment < ApplicationRecord
  belongs_to :movie

  validates :login, presence: true

  scope :my_comments, -> (login) do
    where(login: login)
  end
end
