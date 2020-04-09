Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#message'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :channels, only:[:show, :index, :create]
    end 
  end
  # get '/messageries/:channel'
  # get '/messageries/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
