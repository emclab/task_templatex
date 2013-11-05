TaskTemplatex::Engine.routes.draw do
  
  resources :task_items, :only => [:index]
  resources :templates do
    resources :task_items
  end
  
  root :to => 'templates#index'

end
