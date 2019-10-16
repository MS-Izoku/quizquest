Rails.application.routes.draw do
  get '/', to: "sessions#new"
  resources :questions, only: [:new, :create]
  resources :games, only: [:index, :new, :create, :show]

  resources :sessions, only: [:new, :create]
  resources :users, param: :username, only: [:new, :create, :show]
  get "/login", to: "sessions#new", as: :login
  delete "/byebye", to: "sessions#destroy", as: :logout
  post '/user_responses', to: 'games#user_responses', as: :user_responses
  get "/lose", to: 'games#lose'
  get "/create_new_game", to: 'games#create_new_game'
  post "/create_new_game", to: 'games#create_new_game'
end
