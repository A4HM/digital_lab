Rails.application.routes.draw do
  root "home#index"
  

  devise_for :users, only: [:sessions]

  #search route
  get "/search", to: "home#search", as: :search

  # #labs routes
  resources :labs, only: [:edit, :show, :update] do
    resources :lab_sections, except: [:edit, :show, :update, :destroy]
    resources :lab_videos, only: [:new, :create]
  end

  resources :lab_videos, only: [:edit, :update, :destroy]

  resources :lab_sections, only: [:edit, :show, :update, :destroy] do
    resources :lab_sub_sections, except: [:edit, :show, :update, :destroy]
  end

  resources :lab_sub_sections, only: [:edit, :show, :update, :destroy] do
    resources :images, except: [:edit, :show, :update, :destroy]
  end

  #images routes
  resources :images, only: [:edit, :show, :update, :destroy]


  #3d program routes
  resources :polygons do
    resources :labels, except: [:index, :new]
  end

end