Rails.application.routes.draw do
  devise_for :adminss,skip: [:registrations, :passwords], path: :admin, controllers:{
   sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords], controllers:{
   registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :admin do
   root :to => "homes#top"
   resources :users, only: [:index, :show, :update, :destroy]
  end
  scope module: :public do
  #post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  root to: 'homes#top'
  get "home/about"=>"homes#about"
  resources :users, only: [:index,:show,:edit,:update] do
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  get "search" => "searches#search"
  resources :fields, only: [:index,:create,:show,:update,:destroy,:edit,:new] do
    resource :favorites, only:[:create,:destroy]
    patch "withdrawal" => "users#withdrawal", as: 'withdrawl'

  end

end
