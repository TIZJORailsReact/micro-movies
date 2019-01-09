Rails.application.routes.draw do
  apipie

  resources :movies, only: %i(index show), :defaults => {:format => 'json'} do
    resources :comments, except: :show, :defaults => {:format => 'json'}
    resources :likes, only: :create, :defaults => {:format => 'json'}
    resource :likes, only: :destroy, :defaults => {:format => 'json'}
  end

  get 'favorites/movies', to: 'movies#favorites', :defaults => {:format => 'json'}
end
