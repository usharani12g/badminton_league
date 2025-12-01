Rails.application.routes.draw do
  root 'players#index'
    resources :players
    resources :matches, only: [:index, :new, :create, :show, :destroy]
    get '/leaderboard', to: 'leaderboards#index', as: :leaderboard
end
