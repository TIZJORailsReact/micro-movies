class Comment < ApplicationRecord
  belongs_to :movie

  validates :user_id, presence: true
end
