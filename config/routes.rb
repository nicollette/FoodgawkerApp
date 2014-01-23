FoodgawkerApp::Application.routes.draw do
  root :to => "static_page#index"

  resources :users, :only => [:create, :new], :defaults => {:format => "json"}
  resource :session, :only => [:new, :create, :destroy], :defaults => {:format => "json"}
  
  namespace :api do
    resources :search, :only => [:index],
                      :defaults => {:format => "json"}
    resources :share, :only => [:index]
    resources :top_recipes, :only => [:index]
    resources :recipes, 
              :only => [:index, :create, :show], 
              :defaults => {:format => "json"} do
      member do
        get :prev_recipe
        get :next_recipe
      end
        
    end
    resources :favorite, :only => [:create, :destroy],
                         :defaults => {:format => "json"}
    resources :favorite_recipes, :only => [:index], 
                               :defaults => {:format => "json"}
  end
  
end


