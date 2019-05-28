Rails.application.routes.draw do
  root 'home#index'
  resources :trackings, only: [:create, :new, :index]
  resources :contacts, only: [:create, :new]
  resources :about_us
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
