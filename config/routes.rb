# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :create]
      resources :orders, only: [:create] do
        member do
          post 'pay'
        end
      end
    end
  end
end
