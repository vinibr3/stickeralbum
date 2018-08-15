Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'navigations#album'
  get '/album',    to: 'navigations#album',     as: :album
  get '/exit',     to: 'navigation#exit',       as: :exit
  get '/stickers', to: 'navigations#stickers',  as: :stickers
  get '/packs',    to: 'navigations#packs',     as: :packs
  get '/trades',   to: 'navigations#trade',     as: :trade_requests

  resources :users, only: [] do
  	resources :albums, only: [:show] do
  		resources :spots, only: [:create]
  	end
    resources :stickers,       only: [:index]
    resources :sticker_packs,  only: [:index]
    resources :trade_requests, only: [:index]  
  end
end