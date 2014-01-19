FoodgawkerApp::Application.routes.draw do
  root :to => "static_page#index"

  resources :users, :only => [:create, :new]
  resource :session, :only => [:new, :create, :destroy]
  
  namespace :api do
    resources :search, :only => [:index],
                      :defaults => {:format => "json"}
    resources :recipes, :only => [:index, :create], 
                        :defaults => {:format => "json"}
    resources :favorite, :only => [:create, :destroy],
                         :defaults => {:format => "json"}
    resources :favorite_recipes, :only => [:index], 
                               :defaults => {:format => "json"}
  end
  
end
