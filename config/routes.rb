Rails.application.routes.draw do
  get 'circle_charts', to: 'charts#circle_charts'
  get 'bar_charts', to: 'charts#bar_charts'
  get 'check_developers', to: 'charts#check_developers'
  resources :developers
  resources :managers
  root 'main#index'
end
