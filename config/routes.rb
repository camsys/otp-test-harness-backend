Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do 
    resources :trips, only: [:index, :show] do
      collection do
        get 'approved'
        get 'not_approved'
      end
    end
    #get 'approved' => 'trips#approved'
    #get 'not_approved' => 'trips#not_approved'
  end

  namespace :api do
    ### API V1 ###
    namespace :v1 do
      resources :trips, only: [:index, :create, :show]
    end
  end

end
