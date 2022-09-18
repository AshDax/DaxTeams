Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#root'
  resources :organizations do
    resources :teams
    resources :users
    resources :artifacts
  end
end
  