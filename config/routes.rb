Rails.application.routes.draw do
  apipie

    resources :movies, only: %i(index show), :defaults => { :format => 'json' } do
      resources :comments, except: :show, :defaults => { :format => 'json' }
    end
end
