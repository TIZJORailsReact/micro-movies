json.movies do
  json.array! @movies, partial: 'movie', as: :movie
end
json.recommended do
  json.array! @recommended, partial: 'movie', as: :movie
end
