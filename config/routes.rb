Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  get '/homes/top' => 'public/homes#top'
  get '/homes/about' => 'public/homes#about'
  get 'customers' => 'public/customers#show'
  get 'customers/edit' => 'public/customers#edit'
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  patch '/customers/withdrawal' => 'customers#withdrawal'
  get 'items' => 'public/items#index'
    resources :items, only: [:index]

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  root to: 'homes#top'
  get '/items' => 'items#show'
  get '/genres/edit' => '/genres#edit'
  get '/orders' => 'orders#show'
  get '/orede_details' => 'orede_details#update'
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:new, :create, :show, :edit, :index, :update]
    resources :genres, only: [:index, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orede_details, onle: [:update,]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
