Rails.application.routes.draw do

  root "home#index"
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  resources :questions, only: [:show]
  get "questions/:id/follow_user/:user_id", to: "questions#follow_user", as: "follow_user"
  get "questions/:id/follow_topic/:topic_id", to: "questions#follow_topic", as: "follow_topic"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
