Rails.application.routes.draw do
  root "static_pages#home"
  get 'challenges', to: 'static_pages#challenges'
  get 'completed', to: 'static_pages#completed'
  get 'stats', to: 'static_pages#stats'
  resources :comments, only: [:create]
  resources :comment
  resources :sg
  resources :evangelism
  resources :ser
  resources :eq

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
