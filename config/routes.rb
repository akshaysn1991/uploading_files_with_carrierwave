Rails.application.routes.draw do
  resources :documents, only: [:index, :new, :create, :destroy]
  root "documents#index"
end
