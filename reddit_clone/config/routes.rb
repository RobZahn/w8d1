Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :new, :create] do
    resources :subs, only: [:edit]
  end

  resources :subs, only: [:new, :create, :index, :show, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]

  
end
