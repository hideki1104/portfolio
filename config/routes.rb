Rails.application.routes.draw do
  devise_for :admins
  get 'genres/index'
  get 'genres/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get 'homes/about'
  resources :users,only:[:show,:edit,:update,:destroy]

  namespace :user do
	  resources :trainings,only:[:index,:show]
    resources :conduct_trainings
  end

  namespace :admin do
  	resources :trainings,only:[:index,:new,:create,:update,:edit,:destroy]
	  resources :genres,only:[:index,:edit,:create,:update]
  end
end