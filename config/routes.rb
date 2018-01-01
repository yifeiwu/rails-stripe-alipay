Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :charges
  post 'actual_charge', to: 'charges#actual_charge'
  get 'create_source', to: 'charges#create_source'
  get 'accepted_charge', to: 'charges#accepted_charge'

end
