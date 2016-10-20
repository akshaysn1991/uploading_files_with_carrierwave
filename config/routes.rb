Rails.application.routes.draw do

  resources :attachments, only: [:index, :new, :create]

  resources :documents, only: [:index, :new, :create, :destroy]
  root "attachments#index"
end
