Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'
  root "static_pages#home"
  get 'challenges', to: 'static_pages#challenges'
  get 'completed', to: 'static_pages#completed'
  get 'stats', to: 'static_pages#stats'
  get 'stats_individual', to: 'static_pages#stats_individual'
  get 'completed/:team_id', to: 'static_pages#completed'
  get 'completed/:team_id/:player_id', to: 'static_pages#completed'
  get 'delete/:comment_id', to: 'static_pages#delete', as: 'delete'
  # resources :missions
  resources :comments, only: [:create]
  resources :comment
  resources :teams do
    resources :players
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
