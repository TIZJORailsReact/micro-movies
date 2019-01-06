class Like < ApplicationRecord
  # == Aliases ================================================================
  alias_attribute :login, :user

  # == Relations ==============================================================
  belongs_to :movie

  # == Validations ============================================================
  validates :movie, uniqueness: { scope: :user, message: 'already liked' }
end
