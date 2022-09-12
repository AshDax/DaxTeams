Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#root'
    resources :teams do
      resources :users
      resources :artifacts
    end
end