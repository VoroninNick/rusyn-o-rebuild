RusinO::Application.routes.draw do

get 'analize_home_page', to: 'home#analize_home_page'  


  mount Ckeditor::Engine => '/ckeditor'
get '/users/sign_up', :to => 'error#show', :code => 404
get '/users', :to => 'error#show', :code => 404
#match '/users/sign_in', :to => 'devise/sessions#new', :view => 'user'
  #get "order/index"

  #get "gallery/index"
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  
 # get "homegallery/index"

 # get "test/scss"

 # get "test/zindex"

  

  

  
 # get "/empty", :to => 'empty#index'
  #match "/contact", :to => 'contact#index', :as => 'contact'


  get 'contact'                        => 'contact#new',                     :as => 'contact'
  post 'contact'                        => 'contact#create',                  :as => 'contact_post'

  get "/articles", :to => 'publications#index', :as => 'article_main'
  get "/articles(/page(/:page_number))", :to => 'publications#index', :as => 'publications', :constraints => { :page_number => /\d{1,2}/ }
  get "/article/:item_name", :to => 'publications#item', :as => 'publication_item'




  get "/gallery", :to => 'gallery#images', :as => 'gallery'
  get "/gallery/images", :to => 'gallery#images', :as => 'gallery_images'
  get "/gallery/albums", :to => 'gallery#albums', :as => 'gallery_albums'
  get "/gallery/albums/:album_name", :to => 'gallery#album', :as => 'gallery_album'

  # Vik Ewoods Filter
  #match "/gallery/:filter", :to => 'gallery#index_filter', :as => 'gallery_index_filter'
  get "/gallery/images/filter", :to => 'gallery#images_filter', :as => 'gallery_images_filter'
  get "/gallery/albums/filter", :to => 'gallery#albums_filter', :as => 'gallery_albums_filter'
  get "/gallery/images/:image", to: 'gallery#image_proxy', as: 'gallery_image'
  

  get "/catalog", :to => 'catalog#index', :as => 'catalog'
  get '/catalog/colors', to: 'catalog#colors', as: 'catalog_colors'
  get '/catalog/poslugi-z-blagoustroyu', to: 'catalog#blagoustriy', as: 'catalog_blagoustriy'
  get "/catalog/:category/(:subcategory)", :to => 'catalog#category'
  get "/about", :to => 'about#index', :as => 'about'

  get "/order", :to => 'order#index'



  # errors

  get "/404", :to => "error#show", :code => 404
  get "/422", :to => "error#show", :code => 404
  get "/500", :to => "error#show", :code => 404

  #%w( 404 422 500 ).each do |code|
  #  get code, :to => "error#show", :code => code
  #end






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
  # match ':controller(/:action(/:id))(.:format)'

 # root :to => 'rails_admin/main#dashboard'



 root :to => 'home#index'
 get '1591de9fc787.html', to: 'yandex_mail#confirm'
 get '*a', :to => 'error#show', :code => 404
end
