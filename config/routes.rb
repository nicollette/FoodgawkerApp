FoodgawkerApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:new, :create, :destroy]
  
  namespace :api do
    resources :search, :only => [:index],
                      :defaults => {:format => "json"}
    resources :recipes, :only => [:index, :create], 
                        :defaults => {:format => "json"}
    resources :favorite, :only => [:create, :destroy],
                         :defaults => {:format => "json"}
                      
  end
  
  root :to => "static_page#index"
end
