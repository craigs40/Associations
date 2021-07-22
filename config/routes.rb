# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events, only: %i[new create index show]
  resources :attendees
  resources :users
end
