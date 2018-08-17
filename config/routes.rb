Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'navigations#album'
  get '/album',      to: 'navigations#album',       as: :album
  get '/exit',       to: 'navigation#exit',         as: :exit
  get '/stickers',   to: 'navigations#stickers',    as: :stickers
  get '/packs',      to: 'navigations#packs',       as: :packs
  get '/new-trade',  to: 'navigations#new_trade',   as: :new_trade
  get '/trades',     to: 'navigations#trade',       as: :trade_requests

  resources :users, only: [:index] do
  	resources :albums, only: [:show] do
  		resources :spots, only: [:new,:create]
  	end
    resources :stickers,       only: [:index]
    get '/search',             to: 'stickers#search'
    resources :sticker_packs,  only: [:index, :update]
    resources :trade_requests, only: [:index, :create, :update]  
  end
end