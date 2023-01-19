Rails.application.routes.draw do

  resources :appointments
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :user #s
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  root "home#index"
  resources :users
  resources :patients do
    resources :dosages
    resources :prescriptions
  end




end
