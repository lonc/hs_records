HomeSchool::Application.routes.draw do

  match 'students/select_daily', :to => 'students#select_daily'
  match 'students/daily_list', :to => 'students#daily_list'
  match 'students/update_assigned', :to => 'students#update_assigned'
  match 'assignments/teachers_notes', :to => 'assignments#teachers_notes'
  match 'assignments/:id', :to => 'assignments#insert', :via => :post

  resources :notes

  resources :assignments do
    member do
      post 'insert'
    end
  end        

  resources :subjects do
    member do
      get 'view'
    end
    resources :assignments, :only => [:create, :index, :new]
  end

  resources :students do
    member do
      get 'select_subjects'
      post 'select_save'
    end
  end

  resources :resources

   # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'students#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
