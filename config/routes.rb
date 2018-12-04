Rails.application.routes.draw do
  apipie
    resources :movies, only: %i(index show), format: ['json'] do
      resources :comments, except: :show, format: ['json']
    end
end
