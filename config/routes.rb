Rails.application.routes.draw do
  apipie

    resources :movies, only: %i(index show) do
      resources :comments, except: :show
    end
end
