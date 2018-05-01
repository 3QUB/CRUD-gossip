Rails.application.routes.draw do
  get 'comment/new'
  get 'comment/show'
  get 'comment/create'
  get 'comment/update'
  get 'comment/destroy'
  root 'static_pages#home'
  resources :gossip
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
