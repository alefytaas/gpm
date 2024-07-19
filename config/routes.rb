Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  get 'infos/admins'
  resources :jornadas do
    resources :shift_swaps, only: [:new, :create]
  end
  resources :hospitals, only: [] do
    get 'setores', on: :member
  end
  get 'about', to: 'home#about'
  resources :shift_swaps do
    member do
      patch 'approve'
      patch 'reject'
    end
  end
  resources :escalas
  get 'home/index'
  get 'relatorios', to: 'home#relatorios'
  get 'admins', to: 'infos#admins'
  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
  end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
