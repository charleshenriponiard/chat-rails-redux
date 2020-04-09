Rails.application.routes.draw do
  devise_for :users

  # root to: 'pages#message'
  # get "/:channel", to: "pages#message"

  # namespace :api, defaults: { format: 'json' } do
  #   namespace :v1 do
  #     resources :channels, only:[:show, :index, :create], param: :name
  #   end 
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [] do
        resources :messages, only: [ :index, :create ]
      end
    end
  end
  
  resources :channels, only: [ :show ]
  root to: 'channels#show'
end
