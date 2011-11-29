Jackowscy::Application.routes.draw do

  match "/admin" => redirect("/admin/projects")

  namespace :admin do
    resources :projects do
      resources :images
    end
    resources :authors
    resources :categories
  end

  scope(:path_names => { :new => "nowa", :edit => "edytuj" }) do
    resources :categories, :path => "kategorie", :only => [:index, :show]
  end
  #resources :categories, :only => [:index, :show]

  scope(:path_names => { :new => "nowy", :edit => "edytuj" }) do
    resources :authors, :path => "autorzy", :only => [:index, :show]
  end
  #resources :authors, :only => [:index, :show]

  devise_for :users

  scope(:path_names => { :new => "nowy", :edit => "edytuj" }) do
    resources :projects, :only => [:index, :show], :path => "obrazy" do
      resources :images, :only => [:index, :show], :path => "zdjecia"
    end
    resources :authors, :path => "autorzy"
  end


  # resources :projects, :only => [:index, :show] do
  #   resources :images, :only => [:index, :show]
  # end

  root :to => "home#show"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
