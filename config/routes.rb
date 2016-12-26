Rails.application.routes.draw do
  root "static_pages#home"
  get 'more', to: 'static_pages#more'
  get 'completed', to: 'static_pages#completed'
  resources :comments, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
