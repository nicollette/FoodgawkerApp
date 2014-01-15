FoodgawkerApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:new, :create, :destroy]
  
  namespace :api do
    
  end
end
