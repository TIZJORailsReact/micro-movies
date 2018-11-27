Rails.application.routes.draw do
    resources :movies, only: %i(index show) do
      resources :comments, except: :show
    end
end
