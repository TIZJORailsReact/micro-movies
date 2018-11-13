Rails.application.routes.draw do
  resources :movies, only: %i(index show)
  resources :tags
end
