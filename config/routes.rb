Rails.application.routes.draw do

  root 'discussion_thread#index'

  resources :discussion_threads, only: :index
end
