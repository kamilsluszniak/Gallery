Rails.application.routes.draw do
  

  root 'static_pages#home'
  
  get 'static_pages/home' => 'static_pages#home'
  
  match '/approve', to: 'users#approve', via: 'post'
  
  devise_for :users
  
  resources :drawings
  resources :users do
      resources :drawings
  end
  


   #, :controllers => { :registrations => "users/registrations" } #  users/registrations_controller.rb
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
