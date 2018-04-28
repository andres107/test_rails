Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :apidocs, only: [:index, :swagger], :path => 'api/v1/apidocs'
  namespace :api do
    namespace :v1 do
      get 'restaurants/statistics', to: 'restaurants#statistics'
    end
  end
end
