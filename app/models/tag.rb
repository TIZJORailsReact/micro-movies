class Tag < ApplicationRecord
  has_many :movie

  validates :name, presence: true
end
