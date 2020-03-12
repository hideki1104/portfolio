Rails.application.routes.draw do

  namespace :user do
    get 'post_comments/edit'
  end
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
    delete 'conduct_training' => 'conduct_trainings#destroy_all'
    resources :weights,only:[:index,:new,:create,:update,:destroy]
    resources :training_managements,only:[:create,:index,:show]
    get 'events' , to: 'user/training_managements#events'
    resources :posts,only:[:create,:index,:show,:update,:edit,:destroy] do
      resource :favorites,only:[:create,:destroy]
      resources :post_comments,only:[:create,:edit,:update,:destroy]
    end
    resources :messages, :only => [:create]
    resources :rooms, :only => [:create,:show,:index]
  end

  namespace :admin do
  	resources :trainings,only:[:index,:new,:create,:update,:edit,:destroy]
	  resources :genres,only:[:index,:edit,:create,:update]
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end