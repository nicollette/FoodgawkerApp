FoodgawkerApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:new, :create, :destroy]
  
  namespace :api do
    resources :recipes, :only => [:index], 
                        :defaults => {:format => "json"}
  end
  
  root :to => "static_page#index"
end
