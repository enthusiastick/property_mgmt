PropertyMgmt::Application.routes.draw do

  resources :buildings, only: [:index, :new, :create]

  root 'buildings#new'

end
