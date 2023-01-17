Rails.application.routes.draw do


  resources :patients do
    member do
      delete :destroy
    end
    resources :dosages
    resources :prescriptions
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :user #s
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "patients#index"
end
