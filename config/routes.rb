Rails.application.routes.draw do
  resources :discussion_threads, only: :index
end
