Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get 'static_pages/home' => 'static_pages#home'

  devise_for :users #, :controllers => { :registrations => "users/registrations" } #  users/registrations_controller.rb
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
