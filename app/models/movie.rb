class Movie < ApplicationRecord
  # == Enumerators ============================================================
  enum genre: {
      drama: 0,
      comedy: 1,
      action: 2,
      horror: 3,
      thriller: 4,
      animation: 5
  }, _suffix: :scope

  # == Relations ==============================================================
  has_many :tags

  # == Validations ============================================================
  validates :title, presence: true
end
