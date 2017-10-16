Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do 
    resources :trips, only: [:index, :show]
  end

  namespace :api do
    ### API V1 ###
    namespace :v1 do
      resources :trips, only: [:index, :create]
    end
  end

end
