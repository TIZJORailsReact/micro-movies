Rails.application.routes.draw do
    resources :movies, only: %i(index show), defaults: {format: :json}
    resources :tags, defaults: {format: :json}
end
