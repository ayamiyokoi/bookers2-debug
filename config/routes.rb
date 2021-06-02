Rails.application.routes.draw do

  get 'finders/finder'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'homes_about'
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'finder' => "finders#finder"

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end