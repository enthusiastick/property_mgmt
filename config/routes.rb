PropertyMgmt::Application.routes.draw do

  resources :buildings, only: [:create, :index, :new, :show]
  resources :owners, only: [:create, :destroy, :index, :new, :show]

  root 'buildings#index'

end
