Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get 'homes/about'
  resources :users,only:[:show,:edit,:update,:destroy]
  resources :trainings
  resources :genres,only:[:index,:edit,:create,:update]
end