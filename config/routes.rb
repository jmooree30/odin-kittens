Rails.application.routes.draw do
  root 'kittnens#index'
  resources :kittens
end
