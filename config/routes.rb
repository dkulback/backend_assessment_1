Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get '/ping', to: 'application#ping'
    get '/posts', to: 'posts#index'
  end
end
