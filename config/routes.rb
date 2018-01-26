Rails.application.routes.draw do
  
  namespace :api do
    resources :readings
  end

  resources :devices do
    resources :readings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
