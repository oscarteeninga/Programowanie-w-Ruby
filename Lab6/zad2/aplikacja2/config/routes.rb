Rails.application.routes.draw do
  get 'months/index'
  get 'categories/index'
  get 'welcomes/index'
  resources :months
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
