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
  has_many :comments
  has_many :likes

  # == Validations ============================================================
  validates :title, presence: true

  # == Scopes =================================================================
  scope :liked, -> (login) {joins(:likes).where('likes.user = ?', login)}
  scope :recommended, -> (login) do
    liked = liked(login)
    genres, recommended = [], []
    if liked.present?
      liked.each do |movie|
        genres << movie.genre
      end
      genres.each do |genre|
        recommended << where(genre: genre).sample
      end
    end
    p liked.inspect
    p genres.inspect
    while recommended.size < 5
      recommended << Movie.all.sample
    end
    p recommended.inspect
    recommended
  end

end
