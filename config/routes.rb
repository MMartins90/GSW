Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'sectors', to: 'pages#sectors'
  resources :jobs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
