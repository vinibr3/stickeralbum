Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'navigations#album'
  get '/album', to: 'navigations#album', as: :album
  get '',       to: 'navigation#exit',   as: :exit
  resources :users, only: [] do
  	resources :albums, only: [:show] do
  		resources :spots, only: [:create]
  	end
  end
end