Rails.application.routes.draw do

  devise_for :users
  root 'discussion_thread#index'

  resources :discussion_threads, only: :index
end
