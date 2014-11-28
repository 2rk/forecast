Rails.application.routes.draw do
  resources :opportunities

  resources(:selections, only: :index) { resources :selections, except: :show }
end
