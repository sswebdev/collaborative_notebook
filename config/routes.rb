Notebook::Application.routes.draw do

  resources :notes

  get "pages/mockup"

  root "notes#index"

end
