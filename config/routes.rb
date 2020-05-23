Rails.application.routes.draw do

  root to: "users#home"
  get '/home/about' => 'users#about'

  devise_for :users
  #devise_for :usersはdeviseを使用する際にURLとしてUsersを含むことを示す
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :books

end
